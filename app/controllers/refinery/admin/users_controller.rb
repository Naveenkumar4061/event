module Refinery
  module Admin
    class UsersController < Refinery::AdminController

      before_filter :find_available_plugins, :find_available_roles,
                    :only => [:new, :create, :edit, :update]
      before_filter :redirect_unless_user_editable!, :only => [:edit, :update]
      before_filter :exclude_password_assignment_when_blank!, :only => :update

      require 'csv'

      def index
        @users = User.order('created_at ASC').all

        save_path = Rails.root.join('public',"User_Details_#{current_user.id}.csv")
        CSV.open(save_path,"wb") do |csv|
          csv << ["S.No", "Full Name", "Email", "Mobile","Status","Joined","Company Name", "Site"]
          count=1
          @users.each do |user|              
            csv << [count, user.full_name, user.email, user.mobile , Invite.where(:email=>user.email).blank? ? "Not Invited" : "Invited", "Yes", user.partner.try(:company_name), user.partner.try(:site) ]
            count = count + 1
          end
        end
      end

      def new
        @user = User.new
        @selected_plugin_names = []
      end

      def create
        @user = User.new params[:user].except(:roles)
        @selected_plugin_names = params[:user][:plugins] || []
        @selected_role_names = params[:user][:roles] || []

        if @user.save
          create_successful
        else
          create_failed
        end
      end

      def edit
        @user = User.find(params[:id])
        @selected_plugin_names = @user.plugins.map(&:name)
      end
      
      def update
        @user = User.find(params[:id])
        p "!"*100
        p @user.plugins

        @selected_role_names = params[:user].delete(:roles) || []
        @selected_role_names = @user.roles.select(:title).map(&:title) unless user_can_assign_roles?
        @selected_plugin_names = params[:user][:plugins]

        if user_is_locking_themselves_out?
          flash.now[:error] = t('lockout_prevented', :scope => 'refinery.admin.users.update')
          render :edit and return
        end

        store_user_memento

        @user.plugins.delete_all
        @user.plugins = @selected_plugin_names

        @user.roles = @selected_role_names.map { |r| Refinery::Role[r.downcase] }
        if @user.update_attributes params[:user]
          update_successful
        else
          update_failed
        end
      end

      def destroy
      end

      def upload_users
        begin
          if params[:partner][:id].blank?
            p "@"*32
            raise
          else 
            p "!"*32
            file_data = params[:file].read
            message = "error"
            csv_rows = CSV.parse(file_data)
            csv_rows.each do |row|
              if row[0]=='SI No'
                p "%"*32
                next
              end
              Invite.create(:full_name => row[1],:gender=>row[3],:email=>row[4],:designation=>row[6],:company=>row[7])
              message = "success"
            end
          end
        rescue
          message = "error"
        end
        if message == "success"
          flash[:success] = "Imported Successfully"
        else
          flash[:error] ="Error Importing"          
        end
        redirect_to '/refinery/admin/users/imported_users'
      end
      
      def activate_user
        @user = User.unscoped.find(params[:id])
        @user.update_attribute('deleted_at',nil)
        redirect_to '/refinery/admin/users'
      end

      def inactivate_user
        @user = User.find(params[:id])
        @user.update_attribute('deleted_at',Time.now)
        redirect_to '/refinery/admin/users'
      end

      def inactive_users
        @iusers = User.unscoped.where('deleted_at is not null') 
      end

      def imported_users
        @imported_users = Invite.all
      end

      def import_user
        if User.where('email=?',params[:email]).blank? && Invite.where('email=?',params[:email]).blank?
          @iuser = Invite.create(:email=>params[:email],:partner_id => params[:partner][:id])
          flash[:notice] = "User added Successfully"
        else
          flash[:notice] = "User already added"
        end
        redirect_to '/refinery/admin/users/imported_users'
      end

      def destroy_imported_user
        @invite = Invite.find(params[:invite_id])
        @invite.delete if @invite
        redirect_to '/refinery/admin/users/imported_users'
      end

      def partners
        @partners = Refinery::Partner.all
      end

      def new_partner
        @partner = Refinery::Partner.new
      end

      def create_partner
        @partner = Refinery::Partner.new(params[:partner])
        if @partner.save          
          redirect_to '/refinery/admin/users/partners'
        else
          render :new_partner
        end
      end

      def edit_partner
        @partner = Refinery::Partner.find(params[:cid])
      end

      def update_partner
        @partner = Refinery::Partner.find(params[:id])

        if @partner && @partner.update_attributes(params[:partner])#@partner.update_attributes(:company_name=>params[:partner][:company_name],:address=>params[:partner][:address],:employee_strength=>params[:partner][:employee_strength])
          redirect_to '/refinery/admin/users/partners'
        else
          render :edit_partner
        end
      end

      def deactivate_partner
        @partner = Refinery::Partner.find(params[:id])
        @partner.delete
        redirect_to '/refinery/admin/users/partners'
      end

      def deactive_partners
        @partners = Refinery::Partner.unscoped.where('deleted_at is not null')
        render :partners
      end

      def activate_partner
        @partner = Refinery::Partner.unscoped.find(params[:id])
        @partner.update_attribute('deleted_at',"")
        redirect_to '/refinery/admin/users/partners'
      end

      def upload_partners
        begin
          if params[:partner][:id].blank?
            p "@"*32
            raise
          else 
            p "!"*32
            file_data = params[:file].read
            message = "error"
            csv_rows = CSV.parse(file_data)
            csv_rows.each do |row|
              if row[0]=='SI No'
                p "%"*32
                next
              end
              Refinery::Partner.create(:company_name => row[1],:employee_strength=>row[2])
              message = "success"
            end
          end
        rescue
          message = "error"
        end
        if message == "success"
          flash[:success] = "Imported Successfully"
        else
          flash[:error] ="Error Importing"          
        end
        redirect_to '/refinery/admin/users/partners'
      end


      def partner_users
        @partner = Refinery::Partner.find(params[:id])
        @users = User.unscoped.where(:partner_id=>params[:id])

        save_path = Rails.root.join('public',"Partner_Report_#{current_user.id}.csv")
        CSV.open(save_path,"wb") do |csv|
          csv << ["S.No", "Full Name", "Email", "Mobile","Status","Joined"]
          count=1
          @users.each do |user|              
            csv << [count, user.full_name, user.email, user.mobile , Invite.where(:email=>user.email).blank? ? "Not Invited" : "Invited", "Yes" ]
            count = count + 1
          end
        end
      end

      protected
        def create_successful
          @user.plugins = @selected_plugin_names

              # if the user is a superuser and can assign roles according to this site's
              # settings then the roles are set with the POST data.
          if user_can_assign_roles?
            @user.roles = @selected_role_names.map { |r| Refinery::Role[r.downcase] }
          else
            @user.add_role :refinery
          end
 
          redirect_to '/refinery/admin/users',
                                  :notice => t('created', :what => @user.email, :scope => 'refinery.crudify')
        end

        def create_failed
          render :action => 'new'
        end

        def update_successful
          redirect_to '/refinery/admin/users',
                      :notice => t('updated', :what => @user.email, :scope => 'refinery.crudify')
        end

        def update_failed
          user_memento_rollback!

          render :edit
        end
      
      def find_user
        current_user  
      end

      def find_available_plugins
        @available_plugins = Refinery::Plugins.registered.in_menu.map { |a|
          { :name => a.name, :title => a.title }
        }.sort_by { |a| a[:title] }
      end

      def find_available_roles
        @available_roles = Refinery::Role.all
      end

      def redirect_unless_user_editable!
        redirect_to 'refinery/admin/users' unless current_refinery_user.can_edit? find_user
      end

      private

      def exclude_password_assignment_when_blank!
        if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
          params[:user].except!(:password, :password_confirmation)
        end
      end

      def user_can_assign_roles?
        #Refinery::Authentication.superuser_can_assign_roles &&
        current_refinery_user.has_role?(:superuser)
      end

      def user_is_locking_themselves_out?
        return false if current_refinery_user.id != @user.id || @selected_plugin_names.blank?

        @selected_plugin_names.exclude?('refinery_users') || # removing user plugin access
          @selected_role_names.map(&:downcase).exclude?('refinery') # Or we're removing the refinery role
      end

      def store_user_memento
        # Store the current plugins and roles for this user.
        @previously_selected_plugin_names = @user.plugins.map(&:name)
        @previously_selected_roles = @user.roles
      end

      def user_memento_rollback!
        @user.plugins = @previously_selected_plugin_names
        @user.roles = @previously_selected_roles
        @user.save
      end

    end
  end
end

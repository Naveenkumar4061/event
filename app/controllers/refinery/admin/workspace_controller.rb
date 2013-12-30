module Refinery
  module Admin
    class WorkspaceController < Refinery::AdminController
      require 'csv'            
      
    	def index
        if params[:start_at].blank?
          params[:start_at] = (Time.now-1.month).beginning_of_day.strftime('%Y-%m-%d %H:%M:%S')
          @start_at = (Time.now-1.month).beginning_of_day.strftime('%d-%m-%Y')
        else
          params[:start_at] = params[:start_at].to_datetime.beginning_of_day.strftime('%Y-%m-%d %H:%M:%S')
          @start_at = params[:start_at].to_datetime.beginning_of_day.strftime('%d-%m-%Y')
        end
        if params[:end_at].blank?
          params[:end_at] = (Time.now+1.month).end_of_day.strftime('%Y-%m-%d %H:%M:%S')
          @end_at = (Time.now+1.month).end_of_day.strftime('%d-%m-%Y')
        else
          params[:end_at] = params[:end_at].to_datetime.end_of_day.strftime('%Y-%m-%d %H:%M:%S')
          @end_at = params[:end_at].to_datetime.end_of_day.strftime('%d-%m-%Y')
        end

        @workspace = Workspace.where('start_date > ? and end_date < ?',params[:start_at],params[:end_at])

    	end
      
      def new
        @workspace = Workspace.new
      end

      def create
        @workspace = Workspace.new(params[:workspace])
        @workspace.save
        redirect_to '/refinery/admin/workspace'
      end

      def edit
        @workspace = Workspace.find(params[:id])
      end

      def update
        @workspace = Workspace.find(params[:id])
        @workspace.update_attributes(params[:workspace])
        redirect_to '/refinery/admin/workspace'
      end

      def report        
        @workspace = Workspace.where(:id => params[:id]).try(:first)

        save_path = Rails.root.join('public',"Workspace_Report_#{current_user.id}.csv")
        CSV.open(save_path,"wb") do |csv|
          csv << ["S.No", "Attendee Name", "Email", "Response"]
          count=1
          @workspace.workspace_responses.each do |response|              
            csv << [count, response.user.full_name, response.user.email, response.response]
            count = count + 1
          end
        end

      end

      def restrict_controller
        true
      end 
    end
  end
end

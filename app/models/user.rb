class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  default_scope where('deleted_at is null')
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :full_name, :age, :gender, :company, :designation, :plugins, :partner_id, :mobile, :dob, :c_company_name, :c_address, :c_city, :c_state
  
  has_and_belongs_to_many :roles, :join_table => ::RolesUsers.table_name
  has_many :plugins, :class_name => "UserPlugin", :order => "position ASC", :dependent => :destroy
  has_many :registrations, :class_name => "Refinery::Events::Registration"
  has_many :transactions, :class_name => "Transaction"
  has_many :workspace_responses, :class_name => "WorkspaceResponse"
  has_one :bank_detail, :class_name => "Refinery::BankDetail"
  belongs_to :partner, :class_name => "Refinery::Partner"
  has_many :gifts
  belongs_to :invite
  
  def username
    self.email
  end

  def plugins=(plugin_names)
    if persisted? # don't add plugins when the user_id is nil.
      UserPlugin.delete_all(:user_id => id)

      plugin_names.each_with_index do |plugin_name, index|
        plugins.create(:name => plugin_name, :position => index) if plugin_name.is_a?(String)
      end
    end
  end

  def authorized_plugins
    plugins.collect(&:name) | ::Refinery::Plugins.always_allowed.names
  end

  def add_role(title)
    if title.is_a? ::Role
      raise ArgumentException, "Role should be the title of the role not a role object."
    end

    roles << ::Role[title] unless has_role?(title)
  end

  def has_role?(title)
    if title.is_a? ::Role
      raise ArgumentException, "Role should be the title of the role not a role object."
    end

    roles.any? { |r| r.title == title.to_s.camelize}
  end

  def can_delete?(user_to_delete = self)
    user_to_delete.persisted? &&
      !user_to_delete.has_role?(:superuser) &&
      ::Refinery::Role[:refinery].users.any? &&
      id != user_to_delete.id
  end

  def can_edit?(user_to_edit = self)
    user_to_edit.persisted? && (user_to_edit == self || self.has_role?(:superuser))
  end

end

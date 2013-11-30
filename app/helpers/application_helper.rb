module ApplicationHelper
  
  def refinery_admin_users_path
    '#'
  end

  def is_admin?
    current_user && current_user.roles.map(&:title).include?('Superuser')
  end

  def is_event_admin?
    current_user && current_user.roles.map(&:title).include?('Refinery') && !current_user.roles.map(&:title).include?('Superuser')
  end

end
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

  def new_activity_message_for(record)
    begin
      return if (plugin = find_plugin(record)).blank? || (activity = find_activity(record, plugin)).blank?
    rescue
      return
    end

  link_to t('.latest_activity_message',
            :what => record.send(activity.title),
            :kind => record.class.model_name.human,
            :action => t("with_article \"#{plugin_article(plugin)}\"",
                         :scope => "refinery.#{record_action(record)}")
           ).downcase + " #{record.updated_at.strftime('%Y/%m/%d %H:%M:%S')}".capitalize, eval("#{activity.url}(#{activity.nesting('record')})")
  end

end
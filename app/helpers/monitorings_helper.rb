module MonitoringsHelper
  # helpers/animals_helper.rb
  # Returns a dynamic path based on the provided parameters
  def sti_monitoring_path(type = "monitoring", monitoring = nil, action = nil)
    send "#{format_sti(action, type, monitoring)}_path", monitoring
  end

  def format_sti(action, type, monitoring)
    action || monitoring ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
  
end

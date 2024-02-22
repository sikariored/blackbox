module HistoryHelper
  include TimeFormatHelper

  def format_audit_changes(audit)
    result = ""
    audit.audited_changes.each do |attribute, values|
      old_value, new_value = values
      formatted_new_value = if new_value.is_a?(Time)
                              time_format(new_value)
                            else
                              new_value
                            end
      result += "<div><b>#{attribute}</b> : Смена #{old_value unless old_value != ""} на #{formatted_new_value}</div>"
    end
    result.html_safe
  end
end
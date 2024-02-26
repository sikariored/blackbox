module HistoryHelper
  include TimeFormatHelper

  def format_audit_changes(audit)

    def formatted_old_value(attribute = nil, old_value)

      if old_value == ""
        return ""
      elsif old_value.is_a?(Time)
        return time_format(old_value)
      elsif attribute == 'department_id'
        if old_value.present?
          department = Department.find(old_value)
          if department.name.present?
            return department.name + "(id#{old_value})"
          elsif department.key.present?
            return department.key + "(id#{old_value})"
          end
        end
      elsif attribute == 'role_id'
        if old_value.present?
          role = Role.find(old_value)
          return (role.name.present? ? role.name + "(id#{role.id})" : role.key + "(id#{role.id})")
        end
      end

      old_value
    end

    def formatted_new_value(attribute = nil, new_value)
      if new_value.is_a?(Time)
        return time_format(new_value)
      elsif attribute == 'department_id'
        if new_value.present?
          department = Department.find(new_value)
          return department.name + "(id#{new_value})"
        end
      elsif attribute == 'role_id'
        if new_value.present?
          role = Role.find(new_value)
          return (role.name.present? ? role.name : role.key)
        end
      end

      return new_value
    end

    def formatted_attribute(attribute)
      case attribute
      when 'id'
        return "ID"
      when 'login'
        return "Логин"
      when 'first_name'
        return "Имя"
      when 'last_name'
        return "Фамилия"
      when 'email'
        return "Email"
      when 'encrypted_password'
        return "Зашифрованный пароль"
      when 'reset_password_token'
        return "Токен сброса пароля"
      when 'reset_password_sent_at'
        return "Дата отправки токена сброса пароля"
      when 'remember_created_at'
        return "Дата создания 'remember me' токена"
      when 'sign_in_count'
        return "Количество входов"
      when 'current_sign_in_at'
        return "Дата текущего входа"
      when 'last_sign_in_at'
        return "Дата последнего входа"
      when 'current_sign_in_ip'
        return "IP текущего входа"
      when 'last_sign_in_ip'
        return "IP последнего входа"
      when 'created_at'
        return "Дата создания"
      when 'updated_at'
        return "Дата обновления"
      when 'role_id'
        return "ID Роли"
      when 'department_id'
        return "ID Отдела"
      else
        return attribute
      end
    end

    result = ""
    audit.audited_changes.each do |attribute, values|
      old_value, new_value = values
      result += "<div><b>#{formatted_attribute(attribute)}</b> : #{old_value.present? ? formatted_old_value(attribute, old_value).to_s : 'none'} #{new_value.present? ? ' ==> ' + formatted_new_value(attribute, new_value).to_s : ''}</div>"
    end
    result.html_safe
  end

  def destination_object(audit)

    if audit.auditable.present?

      case audit.auditable_type
      when 'User'
        user = User.find(audit.auditable_id)
        if user.first_name.present? && user.last_name.present?
          user.first_name + ' ' + user.last_name + ' :: ' + "#{user.id}"
        else
          user.login + ' :: ' + "#{user.id}"
        end
      when 'Article'
        article = Article.find(audit.auditable_id)
        article.title + ' :: ' + "#{article.id}"
      when 'Department'
        department = Department.find(audit.auditable_id)
        if department.name.present?
          department.name + ' :: ' + "#{department.id}"
        else
          department.key + ' :: ' + "#{department.id}"
        end
      when 'Role'
        role = Role.find(audit.auditable_id)
        if role.name.present?
          role.name + ' :: ' + "#{role.id}"
        else
          role.key + ' :: ' + "#{role.id}"
        end
      when 'Note'
        note = Note.find(audit.auditable_id)
        note.title + ' :: ' + "#{note.id}"
      when 'SecureRecord'
        secure_record = SecureRecord.find(audit.auditable_id)
        secure_record.title + ' :: ' + "#{secure_record.id}"
      else
        "Indefinite #{audit.auditable_type}"
      end

    else
      "Undetected #{audit.auditable_type} :: #{audit.auditable_id}"
    end
  end

end

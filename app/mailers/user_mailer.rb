class UserMailer < ApplicationMailer
  def test_mail(email)
    mail to: email, subject: "Добро пожаловать в CRYPTA!"
  end
end
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#CREATE CREDENTIALS
Credential.create(key: "can_edit_own_profile", name: "Редактировать свой профиль")

# Credential.create(key: "can_create_user")
Credential.create(key: "can_edit_user", name: "Редактировать пользователя")
# Credential.create(key: "can_delete_user")

# Credential.create(key: "can_create_role")
# Credential.create(key: "can_update_role")
# Credential.create(key: "can_delete_role")

Credential.create(key: "can_assign_department_to_user", name: "Назначать отдел")
# Credential.create(key: "can_assign_credentials_to_user")

Credential.create(key: "can_working_with_articles", name: "Работать со статьями")

#CREATE NIL_DEPART
# Department.create(key: "nil_department", name: "Нулевой отдел")

#CREATE DEPARTMENTS
Department.create(key: "administration", name: "Администрация")
Department.create(key: "it", name: "IT")
Department.create(key: "seo", name: "SEO")

#CREATE ROLES
Role.create!(key: "admin")
Role.create!(key: "user")

# CREATE ADMIN
User.create(login: "admin", email: "admin@itpro.spb.ru", password: "RedAndWhite1!", role_id: 1, credential_ids: Credential.pluck(:id), department_id: 1)

#CREATE TEST USERS
User.create(login: "user", email: "user@mail.ru", password: "123123", role_id: 2, credential_ids: [2], department_id: 1)

10.times do
  User.create(login: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123123", role_id: 2, credential_ids: Credential.pluck(:id).sample, department_id: Department.pluck(:id).sample)
end

# 5.times do
#   Article.create title: Faker::Book.title, body: Faker::Lorem.paragraph
# end
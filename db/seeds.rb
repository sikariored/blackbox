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
Credential.create(key: "can_create_role")
Credential.create(key: "can_update_role")
Credential.create(key: "can_delete_role")

Credential.create(key: "can_create_user")
Credential.create(key: "can_update_user")
Credential.create(key: "can_delete_user")

#CREATE ROLES

Role.create!(key: "admin")
Role.create!(key: "user")

# CREATE USERS
User.create(login: "admin", email: "admin@mail.ru", password: "123123", role_id: 1, credential_ids: Credential.pluck(:id))
User.create(login: "user1", email: "user1@mail.ru", password: "123123", role_id: 2)

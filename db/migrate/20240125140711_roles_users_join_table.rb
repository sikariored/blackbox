class RolesUsersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :roles_users, id: false do |t|
      t.belongs_to :role
      t.belongs_to :user
    end
  end
end

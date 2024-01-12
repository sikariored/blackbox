class CreateUsersCredentialsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :credentials_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :credential
    end
  end
end

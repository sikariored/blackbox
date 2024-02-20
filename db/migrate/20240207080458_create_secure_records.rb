class CreateSecureRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :secure_records do |t|

      t.string :encrypted_title, null: false
      t.string :encrypted_title_iv

      t.string :encrypted_login
      t.string :encrypted_login_iv

      t.string :encrypted_password
      t.string :encrypted_password_iv

      t.string :encrypted_description
      t.string :encrypted_description_iv

      t.timestamps
    end
  end
end

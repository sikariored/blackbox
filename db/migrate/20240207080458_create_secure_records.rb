class CreateSecureRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :secure_records do |t|
      t.string :title, null: false
      t.string :login
      t.string :password
      t.string :description

      t.timestamps
    end
  end
end

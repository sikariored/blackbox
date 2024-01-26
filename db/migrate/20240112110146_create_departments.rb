class CreateDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :departments do |t|

      t.string :key, null: false
      t.string :name
      t.timestamps
    end
  end
end

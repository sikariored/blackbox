class CreateCredentials < ActiveRecord::Migration[7.1]
  def change
    create_table :credentials do |t|

      t.string :key
      t.string :name

      t.timestamps
    end
  end
end

class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|

      t.string :encrypted_title, null: false
      t.string :encrypted_title_iv

      t.string :encrypted_body
      t.string :encrypted_body_iv

      t.timestamps
    end
  end
end

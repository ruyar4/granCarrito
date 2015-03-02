class CreateCervezas < ActiveRecord::Migration
  def change
    create_table :cervezas do |t|
      t.string :name
      t.string :brand
      t.string :photo

      t.timestamps null: false
    end
  end
end

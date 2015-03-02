class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.integer :cantidad
      t.references :user, index: true
      t.references :cerveza, index: true

      t.timestamps null: false
    end
    add_foreign_key :pedidos, :users
    add_foreign_key :pedidos, :cervezas
  end
end

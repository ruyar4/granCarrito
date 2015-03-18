class AddUserToCervezas < ActiveRecord::Migration
  def change
    add_reference :cervezas, :user, index: true
    add_foreign_key :cervezas, :users
  end
end

class AddFromContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :twil, :boolean
  end
end

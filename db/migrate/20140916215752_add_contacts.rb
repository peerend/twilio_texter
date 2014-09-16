class AddContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string 'name'
      t.string 'phone'
      t.timestamps
    end
  end
end

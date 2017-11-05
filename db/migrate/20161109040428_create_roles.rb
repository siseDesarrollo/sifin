class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name,        :null => false, :limit => 45
      t.string :description, :null => false, :limit => 245

      t.timestamps
    end
    add_index "roles", ["name"], :name => "index_role_name", :unique => true
  end
end

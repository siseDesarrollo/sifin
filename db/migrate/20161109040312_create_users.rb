class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name,                 :limit => 45
      t.string   :last_name,            :limit => 45  
      t.string   :second_last_name,     :limit => 45
      t.string   :login,                :null => false, :limit => 30
      t.string   :crypted_password,     :null => false, :limit => 100
      t.string   :password_salt,        :null => false, :limit => 100
      t.string   :email,                :limit => 100
      t.string   :persistence_token,    :null => false, :limit => 100
      t.string   :single_access_token
      t.string   :perishable_token,     :null => false, :limit => 100
      t.integer  :login_count,          :null => false, :default => 0
      t.integer  :failed_login_count,   :null => false, :default => 0
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string   :current_login_ip,     :limit => 100
      t.string   :last_login_ip,        :limit => 100
      t.boolean  :is_active,            :null => false, :default => 1
      t.integer  :role_id,              :null => false

      t.timestamps
    end
    add_index "users", ["login"], :name => "index_users_on_login", :unique => true
    add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
    add_index "users", :perishable_token
  end
end

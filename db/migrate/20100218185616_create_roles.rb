class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :role, :default => "", :null => false
      t.integer :permission, :default => 0, :null => false
      t.string :role_type, :default => Role::RoleTypes::SITE, :null => false
      t.timestamps
    end

  end

  def self.down
    drop_table :roles
  end
end

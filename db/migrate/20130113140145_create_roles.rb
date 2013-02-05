class CreateRoles < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.string  :name
      t.boolean :assignable
      t.timestamps
    end
    
    Role.reset_column_information
    Role.create :name => 'Creator', :assignable => false
    Role.create :name => 'Admin', :assignable => true
    Role.create :name => 'Contributor', :assignable => true
    Role.create :name => 'Contender', :assignable => true
  end
  
  def down
    drop_table :roles
  end
end

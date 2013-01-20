class CreateRoles < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
    
    Role.reset_column_information
    Role.create :name => 'Creator'
    Role.create :name => 'Contributor'
  end
  
  def down
    drop_table :roles
  end
end

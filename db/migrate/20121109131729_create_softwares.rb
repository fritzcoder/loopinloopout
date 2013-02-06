class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :name
      
      t.timestamps
    end
    
    Software.create :name => "Ableton"
    Software.create :name => "Cubase"
    Software.create :name => "Fruity Loops"
    Software.create :name => "Logic"
    Software.create :name => "Pro Tools"
    Software.create :name => "Reason"
    Software.create :name => "Massive"
    
  end
end

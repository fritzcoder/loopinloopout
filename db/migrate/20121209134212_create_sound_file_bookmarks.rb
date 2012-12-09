class CreateSoundFileBookmarks < ActiveRecord::Migration
  def change
    create_table :sound_file_bookmarks do |t|
      t.references :sound_file
      t.references :luser
      
      t.timestamps
    end
  end
end

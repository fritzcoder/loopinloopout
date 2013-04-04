class CreateSoundComments < ActiveRecord::Migration
  def change
    create_table :sound_comments do |t|
      t.references :sound_file
      t.references :luser
      t.integer    :parent_id
      t.decimal    :time
      t.integer    :number, :default => 0
      t.text       :comment
      t.timestamps
    end
  end
end

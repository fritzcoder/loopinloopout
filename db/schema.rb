# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121109154111) do

  create_table "audio_files", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
    t.string   "wave_file_name"
    t.string   "wave_content_type"
    t.integer  "wave_file_size"
    t.datetime "wave_updated_at"
    t.integer  "length"
    t.integer  "bpm"
    t.string   "type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "bank_files", :force => true do |t|
    t.integer  "sound_file_id"
    t.integer  "bank_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "banks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.string   "access"
    t.boolean  "collaboration"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "modes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "softwares", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sound_file_modes", :force => true do |t|
    t.integer  "sound_file_id"
    t.integer  "mode_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sound_file_softwares", :force => true do |t|
    t.text     "notes"
    t.integer  "sound_file_id"
    t.integer  "software_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sound_file_types", :force => true do |t|
    t.integer  "sound_type_id"
    t.integer  "sound_file_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sound_files", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "wave_file_name"
    t.string   "wave_content_type"
    t.integer  "wave_file_size"
    t.datetime "wave_updated_at"
    t.string   "preview_file_name"
    t.string   "preview_content_type"
    t.integer  "preview_file_size"
    t.datetime "preview_updated_at"
    t.integer  "length"
    t.integer  "bpm"
    t.string   "type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "sound_types", :force => true do |t|
    t.string   "name"
    t.integer  "sound_type_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
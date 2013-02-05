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

ActiveRecord::Schema.define(:version => 20130128090216) do

  create_table "bank_bookmarks", :force => true do |t|
    t.integer  "luser_id"
    t.integer  "bank_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.string   "access"
    t.boolean  "collaboration"
    t.integer  "bank_bookmarks_count"
    t.string   "created_by"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "luser_banks", :force => true do |t|
    t.integer  "luser_id"
    t.integer  "bank_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "luser_projects", :force => true do |t|
    t.integer  "project_id"
    t.integer  "luser_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lusers", :force => true do |t|
    t.string   "name"
    t.string   "profile_file_name"
    t.string   "profile_content_type"
    t.integer  "profile_file_size"
    t.datetime "profile_updated_at"
    t.integer  "luser_banks_count"
    t.integer  "luser_Projects_count"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "modes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_files", :force => true do |t|
    t.integer  "sound_file_id"
    t.integer  "project_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "project_scores", :force => true do |t|
    t.integer  "project_id"
    t.string   "point"
    t.text     "description"
    t.integer  "weight"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "type",         :default => "Project"
    t.text     "description"
    t.text     "rules"
    t.text     "prizes"
    t.boolean  "leader_board", :default => false
    t.boolean  "scoring",      :default => false
    t.boolean  "voting",       :default => false
    t.boolean  "invite",       :default => false
    t.string   "access",       :default => "Private"
    t.integer  "votes_count",  :default => 0
    t.string   "created_by"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.boolean  "assignable"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "softwares", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sound_file_bookmarks", :force => true do |t|
    t.integer  "sound_file_id"
    t.integer  "luser_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sound_file_modes", :force => true do |t|
    t.integer  "sound_file_id"
    t.integer  "mode_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sound_file_scores", :force => true do |t|
    t.integer  "project_id"
    t.integer  "sound_file_id"
    t.integer  "project_score_id"
    t.integer  "score",            :default => 0
    t.text     "comment"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
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
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.integer  "length",                     :default => 0
    t.integer  "bpm",                        :default => 0
    t.integer  "listen_count",               :default => 0
    t.integer  "sound_file_bookmarks_count", :default => 0
    t.integer  "votes_count",                :default => 0
    t.string   "type"
    t.string   "created_by"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "sound_types", :force => true do |t|
    t.string   "name"
    t.integer  "sound_type_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "project_id"
    t.integer  "sound_file_id"
    t.integer  "luser_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end

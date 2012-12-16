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

ActiveRecord::Schema.define(:version => 20121215153925) do

  create_table "communities", :force => true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.integer  "max_users",  :default => 20
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "creator_id"
  end

  create_table "community_users", :force => true do |t|
    t.integer  "community_id"
    t.integer  "user_id"
    t.string   "role",         :default => "normal"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "invitations", :force => true do |t|
    t.integer  "invitor_id"
    t.integer  "invitee_id"
    t.integer  "community_id"
    t.string   "invitee_email"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "token"
    t.string   "status"
  end

  add_index "invitations", ["token"], :name => "index_invitations_on_token"

  create_table "task_occurrences", :force => true do |t|
    t.integer  "task_id"
    t.boolean  "checked",                 :default => false
    t.date     "deadline"
    t.text     "remarks"
    t.integer  "user_id"
    t.datetime "completed_at"
    t.integer  "time_in_minutes",         :default => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "task_name"
    t.boolean  "should_be_checked",       :default => true
    t.boolean  "should_send_assign_mail", :default => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.time     "time"
    t.integer  "deadline"
    t.string   "deadline_unit"
    t.boolean  "should_be_checked"
    t.integer  "interval"
    t.string   "interval_unit"
    t.integer  "user_id"
    t.integer  "community_id"
    t.integer  "repeat"
    t.date     "next_occurrence"
    t.string   "allocation_mode"
    t.integer  "allocated_user_id"
    t.boolean  "instantiate_automatically"
    t.boolean  "repeat_infinite"
    t.string   "user_order"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",       :null => false
    t.string   "encrypted_password",     :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "locale",                 :default => "en"
    t.string   "global_role",            :default => "normal"
    t.string   "name"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.boolean  "receive_assign_mail",    :default => true
    t.boolean  "receive_reminder_mail",  :default => true
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

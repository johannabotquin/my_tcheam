# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_17_134925) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_managers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_list_managers_on_list_id"
    t.index ["user_id"], name: "index_list_managers_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.text "members", default: [], array: true
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "memories", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.date "date"
    t.bigint "reward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reward_id"], name: "index_memories_on_reward_id"
  end

  create_table "messsages", force: :cascade do |t|
    t.text "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messsages_on_chatroom_id"
    t.index ["user_id"], name: "index_messsages_on_user_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.string "name"
    t.integer "goal"
    t.bigint "team_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_rewards_on_team_id"
    t.index ["user_id"], name: "index_rewards_on_user_id"
  end

  create_table "task_managers", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_task_managers_on_task_id"
    t.index ["user_id"], name: "index_task_managers_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.boolean "reccurence"
    t.integer "points"
    t.date "deadline"
    t.boolean "achieved"
    t.text "members", default: [], array: true
    t.integer "priority_tag"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "pseudo"
    t.bigint "team_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "list_managers", "lists"
  add_foreign_key "list_managers", "users"
  add_foreign_key "lists", "users"
  add_foreign_key "memories", "rewards"
  add_foreign_key "messsages", "chatrooms"
  add_foreign_key "messsages", "users"
  add_foreign_key "rewards", "teams"
  add_foreign_key "rewards", "users"
  add_foreign_key "task_managers", "tasks"
  add_foreign_key "task_managers", "users"
  add_foreign_key "tasks", "users"
  add_foreign_key "users", "teams"
end

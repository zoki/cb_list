ActiveRecord::Schema.define do
  self.verbose = false

  create_table "records", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
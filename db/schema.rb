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

ActiveRecord::Schema.define(:version => 20140114174840) do

  create_table "activities", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "event_name"
    t.datetime "viewed_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "enquiries", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "telephone"
    t.string   "type_of_enq"
    t.string   "category"
    t.string   "sub_category"
    t.string   "message"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "gifts", :force => true do |t|
    t.integer  "invite_id"
    t.integer  "user_id"
    t.integer  "registration_id"
    t.integer  "attendee_id"
    t.integer  "ticket_id"
    t.integer  "event_id"
    t.integer  "gifted_by"
    t.boolean  "accepted",        :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "invites", :force => true do |t|
    t.string   "email"
    t.integer  "partner_id"
    t.boolean  "approved",   :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "refinery_bank_details", :force => true do |t|
    t.string   "account_name"
    t.integer  "account_number"
    t.string   "bank_name"
    t.string   "branch"
    t.string   "ifsc"
    t.string   "account_type"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "refinery_events", :force => true do |t|
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "category"
    t.string   "sub_category"
    t.string   "url"
    t.text     "description"
    t.integer  "position"
    t.integer  "photo_id"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.text     "schedule"
    t.text     "terms_conditions"
    t.boolean  "published",                :default => false
    t.boolean  "pay_with_card",            :default => true
    t.boolean  "pay_with_cash",            :default => true
    t.boolean  "pay_with_check",           :default => true
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.boolean  "only_master_attendee",     :default => true
    t.boolean  "publish_banner",           :default => false
    t.boolean  "published_by_eo",          :default => false
    t.integer  "banner_position"
    t.text     "censor_warning"
    t.boolean  "print_tickets"
    t.text     "parking_info"
    t.string   "venue_image_file_name"
    t.string   "venue_image_content_type"
    t.integer  "venue_image_file_size"
    t.datetime "venue_image_updated_at"
  end

  create_table "refinery_events_artists", :force => true do |t|
    t.string   "artist_file_name"
    t.string   "artist_content_type"
    t.integer  "artist_file_size"
    t.datetime "artist_updated_at"
    t.text     "description"
    t.integer  "event_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "refinery_events_attendee_details", :force => true do |t|
    t.integer  "field_id"
    t.string   "value"
    t.integer  "attendee_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "refinery_events_attendees", :force => true do |t|
    t.integer  "registration_id"
    t.integer  "ticket_id"
    t.string   "is_master"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "refinery_events_contacts", :force => true do |t|
    t.string   "name"
    t.string   "emailids"
    t.string   "website_url"
    t.string   "facebook_link"
    t.integer  "event_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "refinery_events_faqs", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_events_form_field_options", :force => true do |t|
    t.integer  "form_field_id"
    t.string   "value"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "refinery_events_form_fields", :force => true do |t|
    t.string   "field_name"
    t.string   "field_type"
    t.boolean  "is_mandatory"
    t.integer  "form_id"
    t.integer  "sequence_no"
    t.datetime "deleted_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "refinery_events_forms", :force => true do |t|
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_events_galleries", :force => true do |t|
    t.string   "gimage_file_name"
    t.string   "gimage_content_type"
    t.integer  "gimage_file_size"
    t.datetime "gimage_updated_at"
    t.boolean  "display"
    t.integer  "event_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "refinery_events_outlets", :force => true do |t|
    t.string   "outlet"
    t.string   "address"
    t.string   "timing"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_events_registrations", :force => true do |t|
    t.integer  "no_of_tickets"
    t.decimal  "total",          :precision => 10, :scale => 0
    t.decimal  "discount",       :precision => 10, :scale => 0
    t.decimal  "sales_tax",      :precision => 10, :scale => 0
    t.decimal  "adjustment",     :precision => 10, :scale => 0
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "state"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "transaction_id"
  end

  create_table "refinery_events_restaurants", :force => true do |t|
    t.string   "name"
    t.string   "restaurant_image_file_name"
    t.string   "restaurant_image_content_type"
    t.integer  "restaurant_image_file_size"
    t.datetime "restaurant_image_updated_at"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "phone"
    t.string   "distance"
    t.integer  "event_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "refinery_events_tickets", :force => true do |t|
    t.string   "ticket_name"
    t.string   "description"
    t.datetime "sale_start_on"
    t.datetime "sale_end_on"
    t.decimal  "original_price",       :precision => 10, :scale => 0
    t.decimal  "discounted_price",     :precision => 10, :scale => 0
    t.decimal  "commission",           :precision => 10, :scale => 0
    t.boolean  "is_service_tax"
    t.decimal  "service_tax_percent",  :precision => 10, :scale => 0
    t.integer  "max_quantity"
    t.integer  "min_quantity"
    t.integer  "max_quantity_on_sale"
    t.integer  "display_order"
    t.string   "status"
    t.datetime "deleted_at"
    t.boolean  "is_sold_out"
    t.boolean  "is_not_display"
    t.integer  "tickets_sold"
    t.integer  "event_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  create_table "refinery_events_venues", :force => true do |t|
    t.string   "venue"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "locality"
    t.string   "pincode"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "latitude"
    t.string   "longitude"
    t.string   "title"
  end

  create_table "refinery_images", :force => true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "refinery_page_part_translations", :force => true do |t|
    t.integer  "refinery_page_part_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "refinery_page_part_translations", ["locale"], :name => "index_refinery_page_part_translations_on_locale"
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], :name => "index_refinery_page_part_translations_on_refinery_page_part_id"

  create_table "refinery_page_parts", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_parts", ["id"], :name => "index_refinery_page_parts_on_id"
  add_index "refinery_page_parts", ["refinery_page_id"], :name => "index_refinery_page_parts_on_refinery_page_id"

  create_table "refinery_page_translations", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "locale"
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_translations", ["locale"], :name => "index_refinery_page_translations_on_locale"
  add_index "refinery_page_translations", ["refinery_page_id"], :name => "index_refinery_page_translations_on_refinery_page_id"

  create_table "refinery_pages", :force => true do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.boolean  "draft",               :default => false
    t.boolean  "skip_to_first_child", :default => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "refinery_pages", ["depth"], :name => "index_refinery_pages_on_depth"
  add_index "refinery_pages", ["id"], :name => "index_refinery_pages_on_id"
  add_index "refinery_pages", ["lft"], :name => "index_refinery_pages_on_lft"
  add_index "refinery_pages", ["parent_id"], :name => "index_refinery_pages_on_parent_id"
  add_index "refinery_pages", ["rgt"], :name => "index_refinery_pages_on_rgt"

  create_table "refinery_partners", :force => true do |t|
    t.string   "company_name"
    t.string   "address"
    t.string   "email"
    t.integer  "employee_strength"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "area"
    t.string   "city"
    t.string   "state"
    t.datetime "deleted_at"
    t.string   "site"
  end

  create_table "refinery_resources", :force => true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seo_meta", :force => true do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.text     "meta_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "seo_meta", ["id"], :name => "index_seo_meta_on_id"
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], :name => "id_type_index_on_seo_meta"

  create_table "transactions", :force => true do |t|
    t.decimal  "total",      :precision => 10, :scale => 0
    t.text     "response"
    t.integer  "user_id"
    t.string   "state"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "user_enquireys", :force => true do |t|
    t.string   "email"
    t.string   "subject"
    t.string   "category"
    t.string   "subcategory"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_plugins", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "full_name"
    t.integer  "age"
    t.string   "gender"
    t.string   "designation"
    t.string   "company"
    t.datetime "deleted_at"
    t.integer  "partner_id"
    t.string   "mobile"
    t.string   "dob"
    t.string   "c_company_name"
    t.string   "c_address"
    t.string   "c_area"
    t.string   "c_city"
    t.string   "c_state"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token", :unique => true
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "workspace_attendees", :force => true do |t|
    t.integer  "workspace_id"
    t.integer  "user_id"
    t.boolean  "attending"
    t.boolean  "maybe"
    t.boolean  "wont_attend"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "workspace_responses", :force => true do |t|
    t.integer  "user_id"
    t.string   "response"
    t.integer  "workspace_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "workspaces", :force => true do |t|
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "category"
    t.string   "sub_category"
    t.string   "url"
    t.string   "description"
    t.integer  "position"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.text     "schedule"
    t.text     "terms_conditions"
    t.boolean  "published"
    t.integer  "partner_id"
    t.boolean  "published_by_eo"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.text     "venue"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

end

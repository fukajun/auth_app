class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer  :user_id,       null: false
      t.string   :provider,      null: false
      t.string   :uid,           null: false
      t.string   :access_token
      t.string   :refresh_token
      t.string   :secret
      t.string   :screen_name
      t.string   :name
      t.string   :email
      t.string   :image_url
      t.timestamps null: false
    end
  end
end

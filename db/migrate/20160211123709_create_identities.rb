class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end

class AddDeviseTokenAuthToUsers < ActiveRecord::Migration[8.0]
  def change
    change_table :users, bulk: true do |t|
      ## Required
      t.string :provider, null: false, default: "email"
      t.string :uid, null: false, default: ""
       t.string :encrypted_password, null: false, default: ""

      ## Tokens
      t.json :tokens
    end

    add_index :users, [:uid, :provider], unique: true
  end
end

class AddDeviseFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    ## Required by Devise
    add_column :users, :string, null: false, default: ""
  end
end

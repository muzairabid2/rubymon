class AddNameAndAuthenticationTokenAndFacebookUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :authentication_token, :string
    add_column :users, :facebook_uid, :string
  end
end

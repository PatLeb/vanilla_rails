class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table(:twitter_users) do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :token
      t.string :secret
    end
  end
end

class CreateAccessTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :access_tokens do |t|
      t.string :token
      t.datetime :expires_at
      t.integer :platform, default: 0
      t.integer :miniprogram, default: 0

      t.timestamps
    end
  end
end

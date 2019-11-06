class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :message
      t.timestamp :created_at
      t.datetime :updated_at
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end

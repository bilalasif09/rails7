class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.timestamps
    end
    create_table :posts do |t|
      t.integer :user_id
      t.timestamps
    end
    create_table :post_likes do |t|
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end

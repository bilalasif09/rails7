class AddFields < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :info, :string
    add_column :post_likes, :info, :string
  end
end

class AddStatusStatusPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :status, :boolean, default: false, null: false
  end
end

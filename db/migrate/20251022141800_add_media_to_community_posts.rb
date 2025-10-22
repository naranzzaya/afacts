class AddMediaToCommunityPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :community_posts, :media, :text
  end
end


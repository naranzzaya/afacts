class CreateCommunityPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :community_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.integer :post_type
      t.integer :status

      t.timestamps
    end
  end
end

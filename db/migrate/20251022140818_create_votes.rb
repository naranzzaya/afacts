class CreateVotes < ActiveRecord::Migration[8.0]
  def change
    create_table :votes do |t|
      t.references :community_post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end

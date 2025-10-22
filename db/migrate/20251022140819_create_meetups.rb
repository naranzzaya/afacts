class CreateMeetups < ActiveRecord::Migration[8.0]
  def change
    create_table :meetups do |t|
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :stream_url
      t.integer :status

      t.timestamps
    end
  end
end

class CreateViewParty < ActiveRecord::Migration[7.0]
  def change
    create_table :view_parties do |t|
      t.string :movie_title
      t.integer :movie_id
      t.string :image
      t.integer :duration
      t.date :day
      t.datetime :start_time

      t.timestamps
    end
  end
end

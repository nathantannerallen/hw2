class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.timestamps
      t.string "movie_title"
      t.integer "year_released"
      t.string "mpaa_rating"
      t.integer "studio_id"
    end
  end
end

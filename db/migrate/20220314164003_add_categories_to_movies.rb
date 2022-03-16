class AddCategoriesToMovies < ActiveRecord::Migration[7.0]
  add_reference :ratings, :user_id, foreign_key: { to_table: :users }
  add_reference :ratings, :movie_id, foreign_key: { to_table: :movies }
end

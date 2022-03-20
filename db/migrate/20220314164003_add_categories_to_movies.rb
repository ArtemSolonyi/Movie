class AddCategoriesToMovies < ActiveRecord::Migration[7.0]
  add_reference :ratings, :user, foreign_key: { to_table: :users }
  add_reference :ratings, :movie, foreign_key: { to_table: :movies }
end

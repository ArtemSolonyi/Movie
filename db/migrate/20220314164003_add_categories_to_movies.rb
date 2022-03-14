class AddCategoriesToMovies < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :category, foreign_key:{to_table: :categories}
  end
end

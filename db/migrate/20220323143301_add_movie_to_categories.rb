class AddMovieToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories,:movie,foreign_key:{to_table: :movies}
  end
end

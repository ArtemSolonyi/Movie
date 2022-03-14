class AddRatingToMovies < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :rating, foreign_key:{to_table: :ratings}
  end
end

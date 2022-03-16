class AddRatingTotalToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :rating_total, :float
  end
end

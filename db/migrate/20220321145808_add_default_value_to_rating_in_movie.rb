class AddDefaultValueToRatingInMovie < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :rating_total, :float, default: 0
  end
end

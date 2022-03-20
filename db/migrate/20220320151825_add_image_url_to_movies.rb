class AddImageUrlToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies,:url,:text
  end
end

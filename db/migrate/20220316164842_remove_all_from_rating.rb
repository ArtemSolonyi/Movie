class RemoveAllFromRating < ActiveRecord::Migration[7.0]
  def change
    remove_column :ratings, :users_id
    remove_column :ratings, :movies_id
    remove_column :ratings,:users_id_id
  end
end

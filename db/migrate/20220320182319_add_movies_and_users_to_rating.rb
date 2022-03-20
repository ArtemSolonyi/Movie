class AddMoviesAndUsersToRating < ActiveRecord::Migration[7.0]
  def change
    add_reference :ratings, :movie, foreign_key: { to_table: :movies }
    add_reference :ratings, :user, foreign_key: { to_table: :users }
  end

end

class RemoveGenreIdFromFilms < ActiveRecord::Migration[7.1]
  def change
    remove_column :films, :genre_id, :integer
  end
end

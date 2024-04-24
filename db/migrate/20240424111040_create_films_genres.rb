class CreateFilmsGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :films_genres, id: false do |t|
      t.references :film, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.timestamps
    end
  end
end

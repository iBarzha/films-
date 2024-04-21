class AddAuthorReferenceToFilms < ActiveRecord::Migration[7.1]
  def change
    add_reference :films, :author, foreign_key: true
  end
end
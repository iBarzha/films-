class FilmGenre < ApplicationRecord
  belongs_to :film
  belongs_to :genre

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at film_id genre_id id id_value updated_at]
  end

end

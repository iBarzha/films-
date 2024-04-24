class Genre < ApplicationRecord
  has_many :film_genres
  has_many :films, through: :film_genres


  def self.ransackable_associations(auth_object = nil)
    %w[film_genres films]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id name updated_at]
  end


end

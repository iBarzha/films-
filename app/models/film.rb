class Film < ApplicationRecord
  has_many :comments
  has_one_attached :image

  def self.ransackable_attributes(_auth_object = nil)
    %w[title description year genre producer created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[comments]
  end
end
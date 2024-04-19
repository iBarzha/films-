class Film < ApplicationRecord
  has_many :comments
  has_one :image_attachment, class_name: 'ActiveStorage::Attachment', as: :record
  has_one_attached :image
  belongs_to :genre
  belongs_to :author

  def self.ransackable_attributes(_auth_object = nil)
    %w[title description year genre_id producer created_at updated_at image_filename]
  end


  def self.ransackable_associations(_auth_object = nil)
    %w[comments]
  end
end
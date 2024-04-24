class Film < ApplicationRecord
  has_many :comments
  has_one :image_attachment, class_name: 'ActiveStorage::Attachment', as: :record
  has_one_attached :image
  has_many :film_genres
  has_many :genres, through: :film_genres
  belongs_to :author
  validate :image_content_type
  validate :image_size


  def self.ransackable_attributes(_auth_object = nil)
    %w[title description year genre_id producer created_at updated_at image_filename]
  end


  def self.ransackable_associations(_auth_object = nil)
    %w[comments]
  end

  private
  def image_content_type
    if image.attached? && !image.content_type.in?(%w[image/jpeg image/png])
      errors.add(:image, "must be a JPEG or PNG file")
    end
  end

  def image_size
    if image.attached? && image.blob.byte_size > 2.megabytes
      errors.add(:photo, "must be less than 2MB")
    end
  end

end
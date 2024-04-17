class User < ApplicationRecord

  has_many :comments

  def admin?
    self.admin
  end

  def make_admin!
    self.update(admin: true)
  end

  def self.ransackable_associations(_auth_object = nil)
    ["comments"]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[admin created_at email id remember_created_at reset_password_sent_at reset_password_token]
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def self.ransackable_attributes(_auth_object = nil)
    %w[id email created_at updated_at]
  end

  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
end

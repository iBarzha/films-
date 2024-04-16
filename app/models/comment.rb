class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :film

  def self.ransackable_attributes(_auth_object = nil)
    %w[body created_at film_id id updated_at user_id] # Список атрибутов, которые вы разрешаете для поиска
  end

end

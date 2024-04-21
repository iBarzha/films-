class WelcomeController < ApplicationController
  def index
    @films = Film.order(created_at: :desc).limit(5)
  end

end

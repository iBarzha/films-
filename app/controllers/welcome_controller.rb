class WelcomeController < ApplicationController
  def index
    @films = Film.order(created_at: :desc).limit(6)
    @random_films = Film.order("RANDOM()").limit(6)
  end

end

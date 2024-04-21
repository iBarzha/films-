class WelcomeController < ApplicationController
  def index
    @film = Film.first
  end

end

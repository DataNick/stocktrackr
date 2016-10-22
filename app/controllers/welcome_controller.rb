class WelcomeController < ApplicationController
  def index
    @positions = Position.all
  end
end

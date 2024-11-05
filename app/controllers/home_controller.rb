  # app/controllers/home_controller.rb
  class HomeController < ApplicationController
    def index
      @spots = Spot.all
      @landmarks = Landmark.all
    end


    def club
    end
  end
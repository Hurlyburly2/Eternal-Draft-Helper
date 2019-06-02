require "google/cloud/vision"

class ScreenshotsController < ApplicationController
  def index
    
  end
  
  def create 
    vision = Google::Cloud::Vision.new
    binding.pry
  end
end

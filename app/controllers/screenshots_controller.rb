require "google/cloud/vision"

class ScreenshotsController < ApplicationController
  def index
    
  end
  
  def create 
    vision = Google::Cloud::Vision.new
    card_text = vision.image params["screenshot"]["draft_photo"].tempfile.path
    card_text = card_text.text
    
    binding.pry
  end
end

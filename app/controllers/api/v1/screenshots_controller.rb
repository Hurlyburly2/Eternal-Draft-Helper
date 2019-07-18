require "google/cloud/vision"
require "fuzzy_match"

class Api::V1::ScreenshotsController < ApplicationController
  def index
    
  end
  
  def create
    vision = Google::Cloud::Vision.new
    card_text = vision.image params["image"].tempfile.path
    card_text = card_text.text
    
    #FUZZY MATCH TEST STUFF:
    test_word = FuzzyMatch.new(['jaslfdkjsdfal', 'sothngsah', 'fjsdlaj']).find('something')
    
    binding.pry
  end
end

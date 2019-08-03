require "fuzzy_match"

class Screenshot < ApplicationRecord
  # mount_uploader :url, DraftImageUploader
  mount_uploader :draft_photo, DraftPhotoUploader
  
  attr_reader :card_text, :bad_matches
  
  def initialize(card_text)
    @card_text = card_text
    @bad_matches = [
      "profile",
      "decks",
      "packs",
      "store",
      "home"
    ]
  end
  
  def parse_text
    split_text = @card_text.split("\n")
    
    current_cardset = find_expansion(split_text)
    card_names = current_cardset.cards.pluck(:card_name)
    matches = []
    matcher = FuzzyMatch.new(card_names, :threshold => 0.99, :must_match_at_least_one_word => true)
    
    split_text.each do |word|
      if !@bad_matches.include?(word.downcase)
        found_card = matcher.find(word)
        if found_card != nil && found_card != "Swamp" && found_card != "Island" && found_card != "Mountain" && found_card != "Plains" && found_card != "Forest"
          matches << found_card
        end
      end
    end
    return matches
  end
  
  def find_expansion(split_text)
    expansions = ["Magic Core Set 2020", "War of the Spark"]
    found_expansion = ""
    expansions.each do |expansion_name|
      if split_text.include?(expansion_name)
        found_expansion = expansion_name
        break
      end
    end
    
    expansion_code = ""
    case found_expansion
    when "Magic Core Set 2020"
      expansion_code = "M20"
    end
    return CardSet.find_by(name: expansion_code)
  end
end

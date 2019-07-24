class RatingSystem < ApplicationRecord
  validates :name, presence: true
  belongs_to :card_set
  
  has_many :ratings
  
  def get_url
    this.url.split(', ')
  end
  
  def self.get_ratings(rating_system)
    urls = JSON.parse(rating_system.urls)
    
    url_counter = 0
    urls.each do |url|
      if (rating_system.name == "Frank Karsten")
        data = getFrankKarstenRatings(rating_system)
      elsif (rating_system.name == "Luis Scott-Vargas")
        getLSVWebCrawl(url, rating_system, url_counter)
        url_counter += 1
      end
    end
    
    if rating_system.name == "Luis Scott-Vargas"
      LSVAddLands(rating_system)
    end
  end
  
  def self.getLSVWebCrawl(url, rating_system, url_counter)
    encoded_url = URI.encode(url)
    uri = URI.parse(encoded_url)
    page = Nokogiri::HTML(open(uri))
    
    card_names = page.css("h2").to_s   #pulls card names
    card_names = card_names.split("</h2><h2>Top")[0]
    card_names[0..3] = ""
    card_names = card_names.split("</h2><h2>")
    
    card_ratings = page.css("h3").to_s   #pulls card ratings
    card_ratings = card_ratings.split("</h3><h3 class=")[0]
    card_ratings[0..3] = ""
    card_ratings = card_ratings.split("</h3><h3>")
    card_ratings.shift
  
    cards_with_ratings = {}
    if url_counter == 0
      card_ratings = card_ratings.select { |rating| !rating.include?("Flavor") }
      
      card_names = card_names.select { |name| name != "Artifacts" }
      index_of_lifegain_lands = card_names.index { |name| name.include?("Bloodfell Caves") }
      card_names = card_names[0..(index_of_lifegain_lands - 1)]
      
      card_names.each_with_index do |name, index|
        card_ratings[index] = card_ratings[index].split(" // ")[0]
        card_ratings[index] = card_ratings[index].split(": ")[1]
        cards_with_ratings[name] = card_ratings[index].to_f
      end
      
    else
      card_ratings = card_ratings.select { |rating| !rating.include?("Flavor") }
      
      card_names.each_with_index do |name, index|
        card_ratings[index] = card_ratings[index].split(" // ")[0]
        card_ratings[index] = card_ratings[index].split(": ")[1]
        cards_with_ratings[name] = card_ratings[index].to_f
      end
    end
    
    cards_with_ratings.each do |card|
      found_card = Card.find_by(card_name: card[0])
      Rating.create(rating: card[1].to_f, card: found_card, rating_system: rating_system)
    end
  end
  
  def self.LSVAddLands(rating_system)
    if (rating_system.name == "Luis Scott-Vargas")
      # Lands manually entered due to wonky website setup (ugh)
      lands = {
        "Bloodfell Caves" => 3.0,
        "Blossoming Sands" => 3.0,
        "Cryptic Caves" => 3.0,
        "Dismal Backwater" => 3.0,
        "Evolving Wilds" => 3.0,
        "Field of the Dead" => 0.0,
        "Jungle Hollow" => 3.0,
        "Lotus Field" => 2.0,
        "Rugged Highlands" => 3.0,
        "Scoured Barrens" => 3.0,
        "Swiftwater Cliffs" => 3.0,
        "Temple of Epiphany" => 3.5,
        "Temple of Malady" => 3.5,
        "Temple of Mystery" => 3.5,
        "Temple of Silence" => 3.5,
        "Temple of Triumph" => 3.5,
        "Thornwood Falls" => 3.0,
        "Tranquil Cove" => 3.0,
        "Wind-Scarred Crag" => 3.0
      }
      
      lands.each do |card|
        found_card = Card.find_by(card_name: card[0])
        Rating.create(rating: card[1].to_f, card: found_card, rating_system: rating_system)
      end
    end
  end
  
  def self.getFrankKarstenRatings(rating_system)
    session = GoogleDrive::Session.from_config("config.json")
    spreadsheet = session.spreadsheet_by_key("1DqbBD_xI8Lr3KwZgYMhevC5M43sYQ-WVjYQffBqqTgU").worksheets[0]
    rows = spreadsheet.rows
    rows[1..rows.length-1].each do |row|
      card = Card.find_by(card_name: row[0])
      Rating.create(rating: row[4].to_f, card: card, rating_system: rating_system)
    end
  end
end

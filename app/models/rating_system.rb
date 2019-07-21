class RatingSystem < ApplicationRecord
  validates :name, presence: true
  belongs_to :card_set
  
  has_many :ratings
  
  def get_url
    this.url.split(', ')
  end
  
  def self.get_ratings(rating_system)
    # url = rating_system.urls
    # encoded_url = URI.encode(url)
    # uri = URI.parse(encoded_url)
    # page = Nokogiri::HTML(open(uri))
    
    data = {}
    if (rating_system.name == "Frank Karsten")
      data = getFrankKarstenRatings(rating_system)
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

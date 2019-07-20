# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#CALL THIS TO GET CARDS
# https://api.scryfall.com/cards/search?q=set=m20

require 'pry'

m20_sources = ["https://api.scryfall.com/cards/search?q=set=m20", "https://api.scryfall.com/cards/search?q=set=m20&page=2"]

m20_cards = []
m20_sources.each do |source|
  response = HTTParty.get(source)
  parsed_response = JSON.parse(response.body)
  m20_cards += parsed_response["data"]
end

CardSet.create(name: "M20")
m20_cardset = CardSet.find_by(name: "M20")

m20_cards.each do |card|
  colors = ""
  if card["colors"].length > 0
    colors = card["colors"].join('')
  else
    colors = "X"
  end
  Card.create(card_name: card["name"], image_url: card["image_uris"]["normal"], card_set: m20_cardset, small_image_url: card["image_uris"]["small"], colors: colors, mana_cost: card["cmc"])
end

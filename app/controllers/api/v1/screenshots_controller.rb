require "google/cloud/vision"
require "fuzzy_match"

class Api::V1::ScreenshotsController < ApplicationController
  def index
    
  end
  
  def create
    #USE DURING PRODUCTION (AND FOR TESTING THE ACTUAL API)
    # vision = Google::Cloud::Vision.new
    # card_text = vision.image params["image"].tempfile.path
    # card_text = card_text.text.text
    
    #USE DURING PRODUCTION (DUMMY DATA FOR DEVELOPMENT)
    card_text = "Profile\nDecks\nPacks\nStore\n600\n400\nHome\nAUMITLD\nPack 1\nDeck\nPick 1\nWar of the Spark\n0/40 Cards\nSPARK\nLiliana's Triumph\nBulwark Giant\nSoul Diviner\nBond of Flourishing\nVraska, Swarm's Eminence 2\nCreature Zombie Wizard\nLegendary Planeswalker Vraska\nLook at the top three cards of your\nEach opponent sacrifices a creature. If\nyou control a Liliana planeswalker,\ne, Remove a counter from an artifact,\nNour hand Put the rest on the bottom.\nt your library in any order. You gain 3\n2/3\n3/6\nTopple the Statue\nVampire Opportunist\nRelentless dvance\nGrim Initiate\nNaga Eternal\nCreature- Zombie Warrior\nInstant\nTap target permanent. If it's an\nartifact, destroy it\nFirst strike\n:Each opponent loses 2 life and\nvou ain 2 life.\n3/2\n2/1\n1/1\nBand Together\nPrimordial Wurm\nIron Bully\nMana Geode\n2G\n4\nInstant\nArtifact Creature Golem\nArtifact\nMenace\nWhen Iron Bully enters the battlefield\nUp to two target creatures you control\nWhen Mana Geode enters the\neach deal clamage equal to their\npower\nbattlefield, scry 1,\ntarget o\n1 counte\ntarget creature\nSideboard\n7/6\n1/1\nAARON MILLER\nO Cards\n"
    
    #FUZZY MATCH TEST STUFF:
    test_word = FuzzyMatch.new(['jaslfdkjsdfal', 'sothngsah', 'fjsdlaj']).find('something')
  end
end

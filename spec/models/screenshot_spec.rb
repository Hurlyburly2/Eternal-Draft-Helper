require 'rails_helper'

RSpec.describe Screenshot, type: :model do
  card_text = "Profile\nDecks\nPacks\nStore\nMastery\n700\nHome\nLIN ITED\nPack 1\nPick 1\nMagic Core Set 2020\nCORE SET CA\nLeyline of Abundance\n2\nMaster Splicer\nRisen Reef\nGriffin Sentinel\nCreeping Trailblazer\nCreature Griffin\nEnchantment\nCreature Human Artificer\nM\nCreature Flemental\nCreature Elemental\nM3\nIf Leyine of Abundance is in your opening\nhand, you may begin the game with It on\nthe battlafed\nWhanever Risen Reaf or anothar Eamantal\nentwrs the baitulield under your canirol,\nInnk t the top cerd of your librNry It it's\nland card, you mey put it onto the\nbatticficid tappod. If you don't put the card\nonto the batt ofleld, put It iato your hand.\nOther Elementals you control get\nWhen Master Splicer anters the\nbattletield, create a 3/3 colorless\nGolem artifact creature token.\nGolems you contral get 1/+1.\n3Creeping Trailblazer gels +1/+1\nWhene yaU pa crepture for mana po0\nFlying, Vigilance\nan addit onal\nPut 1/+1 tounter on each cresture\nyou control\nuntil and of turn for aach Elamontal\nyou control.\n1/1\n2/2\n1/3\n1/1\nWARREN MALY\nNOAH BRADLEY\nCHIPPY\nlonAN GRNIER\nJonAN GRINIER\nAgonizing Syphon\nMind Rot\nMoorland Inquisitor\n26\nSage's Row Denizen\n20\n3\nUnholy Indenture\nCreature- Vedalken Wizard\nEnchaniment-Aura\nCreature Human Saldier\nME\nM\nSarcery\nMD\nSorcery\nMA\nWhenever another blue creature-\nenters the battlefield under your\ncontrol, target piayer puts the top two\ncards of their library into their\ngraveyard.\nEnchant creature\nAgonizing Syphon deals 3 damage to\nany target and you gain 3 life\nx: Mooriand Inquisitor gains first\nstrike until end of turn\nWhen enchanted creature dies, return\nthat card to the battlefield under your\ncontrol with a +1/+1 countar an it\nTarget player discards two cards\n2/3\n2/2\nDAVID PALUMBO\nStB MCKIN8ON\nSVEILIN VELINOY\nSEn MCKINNON\nSEB MCKINNON\nGrowth Cycle\n320\nAnvilwrought Raptor\nSwiftwater Cliffs\nFire Elemental\nPlummet\n1\n4\nCrearure Elemental\nInstanr\nLand\nInstant\nArrifact Creature - Bird\nMS\nME\nSwittwater Clifts enters the battiefield\nTarget creature gets +3/+3 until end of\nturn. It gets an additional +2/+2 until\nend af turn for each card named\nGrowth Cycle in your graveyard\ntapped.\nDestroy target creature with flying\nFlying, First strike\nWhen Swiftwater Cliffs enters the\nbattietield, you gain 1 lite.\n:Add or\n5/4\n2/1\nFILIP BUBBUAN\nSVLTLIN VELINDY\nJAMES ZAPATA\nEYTAN ZANA\nIDL SLUCHER\n"
  
  scenario "Creating a new Screenshot- it has initializes with correct properties" do
    screenshot = Screenshot.new(card_text)
    
    expect(screenshot.card_text).to eq card_text
    expect(screenshot.bad_matches).to eq [
                                            "profile",
                                            "decks",
                                            "packs",
                                            "store",
                                            "home"
                                          ]
  end
  
  scenario "find_expansion pulls out the expansion associated with the card text (update this test for different expansions as needed)" do
    m20_cardSet = CardSet.create(name: "M20")
    
    screenshot = Screenshot.new(card_text.split)
    expect(screenshot.find_expansion(card_text.split("\n"))).to eq m20_cardSet
  end
  
  # scenario "parse_text returns the card names from the image" do
  #   screenshot = Screenshot.new(card_text)
  #   puts screenshot.parse_text
  # end
end

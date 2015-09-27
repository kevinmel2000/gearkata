# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
def seed_items
  puts 'Seeding items'

  Item.delete_all

  hash = {
    # Rock Climbing / Bouldering
    'Guidebook' =>                        ['',1,'climbing-guidebook.jpg',['rock climbing','bouldering']],
    '50m Rope' =>                         ['Probably not long enough',1,'rope-50.jpg',['rock climbing']],
    '60m Rope' =>                         ['Might be long enough',1,'rope-60.jpg',['rock climbing']],
    '70m Rope' =>                         ['Should be long enough',1,'rope-70.jpg',['rock climbing']],
    'Rope Bag' =>                         ['To keep the rope clean and dry',1,'rope-bag.jpg',['rock climbing']],
    'Approach Shoes' =>                   ['Comfy, stylish footwear',2,'approach-shoes.jpg',['rock climbing','bouldering','clothes']],
    'Climbing Shoes' =>                   ['Tight, uncomfortable footwear',2,'climbingshoes.jpg',['rock climbing','bouldering','clothes']],
    'Climbing Harness' =>                 ['Absolutely essential',1,'climbingharness.jpg',['rock climbing']],
    'Belay Device' =>                     ['Something to keep your partner alive',1,'belaydevice.jpg',['rock climbing']],
    'Grigri' =>                           ['The Petzl way to hangdog',1,'grigri.jpg',['rock climbing']],
    'Carabiner' =>                        ['',4,'carabiner.jpg',['rock climbing']],
    'Locking Carabiner' =>                ['',4,'locking_carabiner.jpg',['rock climbing']],
    'Sling' =>                            ['',2,'climbing_sling.jpg',['rock climbing']],
    'Daisy Chain' =>                      ['',2,'daisy_chain.png',['rock climbing']],
    'Water Bottle' =>                     ['Should also contain water',1,'water-bottle.jpg',['camping','rock climbing']],
    'Quickdraws' =>                       ['The more the merrier',10,'quickdraw.jpg',['rock climbing']],
    'Chalk Bag' =>                        ['',1,'chalk-bag.jpg',['rock climbing','bouldering']],
    'Crash Pad' =>                        ['',1,'creash_pad.jpg',['bouldering']],
    'Helmet' =>                           ['Ye olde brain bucket',1,'helmet.jpg',['rock climbing','skiing','snowboarding']],

    # Camping
    'Compass' =>                          ['',1,'compass.jpg',['camping']],
    'Map' =>                              ['',1,'map.jpg',['camping','travel']],
    'Whistle' =>                          ['',1,'whistle.jpg',['camping']],
    'Gaiters' =>                          ['',2,'gaiters.jpg',['camping','snowshoeing']],
    'Bear Spray' =>                       ['',1,'bear-spray.jpg',['camping']],
    'Sleeping Bag' =>                     ['',1,'sleeping-bag.jpg',['camping']],
    'Sleeping Pad' =>                     ['',1,'sleeping-pad.jpg',['camping']],
    'Pillow' =>                           ['',1,'pillow.jpg',['travel','camping']],
    'Hammock' =>                          ['',1,'hammock.jpg',['camping']],
    'Swimsuit' =>                         ['You try finding an image of a swimsuit without a woman in it',1,'swimsuit.jpg',['camping']],
    'Tent' =>                             ['',1,'tent.jpg',['camping']],
    'Towel' =>                            ["Don't leave home without it",1,'towel.jpg',[]],
    'Camp Stove' =>                       ['',1,'camp_stove.jpg',['camping']],
    'Camp Stove Fuel' =>                  ['',1,'camp_stove_fuel.jpg',['camping']],
    'Matches, waterproof' =>              ['',50,'matches.jpg',['camping']],
    'Cigarette Lighter' =>                ['',1,'cigarette_lighter.jpg',['camping']],
    'Water Filter' =>                     ['',1,'water_filter.jpg',['camping']],
    'Aluminum Foil' =>                    ['',1,'aluminum_foil.jpg',['camping']],

    # Winter
    'Toque' =>                            ['',1,'toque.jpg',['camping','snowboarding','skiing','snowshoeing','clothes']],
    'Gloves' =>                           ['',2,'gloves.jpg',['snowboarding','skiing','clothes']],
    'Mittens' =>                          ['',2,'mittens.jpg',['snowboarding','skiing','clothes']],
    'Scarf' =>                            ['',2,'scarf.jpg',['snowboarding','skiing','snowshoeing','clothes']],
    'Winter Boots' =>                     ['',2,'winter_boots.jpg',['snowshoeing','clothes']],

    # Ski, Snowboard and Snowshoeing
    'Ski Jacket' =>                       ['',1,'ski_jacket.jpeg',['snowboarding','skiing']],
    'Ski Pants' =>                        ['',1,'ski_pants.jpg',['snowboarding','skiing']],
    'Ski Goggles' =>                      ['',1,'ski_goggles.jpg',['snowboarding','skiing','snowshoeing']],
    'Snowboard' =>                        ['',1,'snowboard.jpg',['snowboarding']],
    'Snowboard Boots' =>                  ['',2,'snowboard_boots.jpg',['snowboarding']],
    'Snowboard Tool' =>                   ['',1,'snowboard_tool.jpg',['snowboarding','skiing']],
    'Snowboard Lock' =>                   ['',1,'snowboard_lock.jpg',['snowboarding','skiing']],
    'Skiis' =>                            ['',2,'skiis.jpg',['skiing']],
    'Ski Boots' =>                        ['',2,'ski_boots.jpg',['skiing']],
    'Ski Poles' =>                        ['',2,'ski_poles.jpg',['skiing']],
    'Ski Skins' =>                        ['',2,'ski_skins.jpg',['skiing']],
    'Snowshoes' =>                        ['',2,'snowshoes.jpg',['snowshoeing']],
    'Avalanche Beacon' =>                 ['',1,'avalanche_beacon.jpg',['snowboarding','skiing','snowshoeing']],
    'Avalanche Shovel' =>                 ['',1,'avalanche_shovel.jpg',['snowboarding','skiing','snowshoeing']],
    'Avalanche Probe' =>                  ['',1,'avalanche_probe.jpg',['snowboarding','skiing','snowshoeing']],

    # Travel
    'Passport' =>                         ['',1,'passport.jpg',['travel']],
    'Foreign Currency' =>                 ['',100,'currency.jpg',['travel']],
    'Sunglasses' =>                       ['',1,'sunglasses.jpg',['travel']],
    'GPS Unit' =>                         ['',1,'gps_unit.jpg',['travel','camping','electronics']],
    'Flashlight' =>                       ['',1,'flashlight.jpg',['camping','electronics']],
    'Headlamp' =>                         ['',1,'headlamp.jpg',['camping','rock climbing']],
    'Knife' =>                            ['',1,'knife.jpg',['camping','rock climbing']],
    'Daypack' =>                          ['',1,'daypack.jpg',['camping','snowboarding','skiing','snowshoeing','rock climbing']],
    'Hotel Reservation' =>                ['',1,'hotel_reservation.jpg',['travel']],
    'Sunscreen' =>                        ['',1,'sunscreen.jpg',['travel']],
    'Zinc Oxide' =>                       ['',1,'zinc_oxide.jpg',['travel']],
    'Lip Balm' =>                         ['',1,'lip_balm.jpg',['travel']],
    'Insect Repellent' =>                 ['',1,'insect_repellent.jpg',['travel']],
    'Bug Spray' =>                        ['',1,'insect_repellent.jpg',['travel']],
    'Toilet Paper' =>                     ['',1,'toilet_paper.jpg',['travel']],
    'Tampons' =>                          ['',3,'tampons.jpg',['travel']],
    'Wallet' =>                           ['',1,'wallet.jpg',['travel']],
    'Watch' =>                            ['',1,'watch.jpg',['travel']],
    'Cellphone' =>                        ['',1,'iphone.jpg',['travel']],
    'Camera' =>                           ['',1,'camera.jpg',['travel']],

    # Clothes
    'Hat' =>                              ['',1,'baseball_hat.jpg',['clothes']],
    'Waterproof Hat' =>                   ['',1,'',['clothes']],
    'Running Shoes' =>                    ['',2,'',['clothes']],
    'Hiking Boots' =>                     ['',2,'',['clothes','camping']],
    'Sandals' =>                          ['',2,'',['clothes']],
    'Flip-flops' =>                       ['',2,'',['clothes']],
    'Hoodie' =>                           ['',1,'',['clothes']],
    'T-Shirt' =>                          ['',1,'',['clothes']],
    'Sweater' =>                          ['',1,'',['clothes']],
    'Rain Coat' =>                        ['',1,'',['clothes']],
    'Rain Pants' =>                       ['',1,'',['clothes']],

    # Containers
    'Backpack' =>                         ['',1,'',['containers','camping']],
    'Duffel Bag' =>                       ['',1,'',['containers']],

    # Food
    'Breakfast' =>                        ['',1,'breakfast.jpg',['food']],
    'Lunch' =>                            ['',1,'lunch.jpg',['food']],
    'Dinner' =>                           ['',1,'',['food']],
    'Supper' =>                           ['',1,'',['food']],
    'Energy Bar' =>                       ['',2,'energy_bar.jpg',['food']],
    'Energy Gel' =>                       ['',2,'',['food']],
    'Trail Mix' =>                        ['',1,'',['food']],

    # First Aid
    'First Aid Kit' =>                    ['',1,'',['first aid']],
    'Bandages 1" x 3"' =>                 ['',4,'',['first aid']],
    'Bandages 2" x 3.5"' =>               ['',4,'',['first aid']],
    'Adhesive Pads 2" x 3.5"' =>          ['',4,'',['first aid']],
    'Fingertip Bandages' =>               ['',4,'',['first aid']],
    'Knuckle Bandages' =>                 ['',4,'',['first aid']],
    'Blister Bandages' =>                 ['',4,'',['first aid']],
    'Eye Pads' =>                         ['',2,'',['first aid']],
    'Gauze Pads 2" x 2"' =>               ['',4,'',['first aid']],
    'Gauze Pads 3" x 3"' =>               ['',4,'',['first aid']],
    'Gauze Pads 4" x 4"' =>               ['',4,'',['first aid']],
    'Burn Dressing 2" x 3"' =>            ['',4,'',['first aid']],
    'Burn Dressing 4" x 4"' =>            ['',4,'',['first aid']],
    'Adhesive Tape' =>                    ['',1,'',['first aid']],
    'Compress Bandages 4"' =>             ['',2,'',['first aid']],
    'Compress Bandages 2"' =>             ['',2,'',['first aid']],
    'Gauze Roll Bandages 2"' =>           ['',1,'',['first aid']],
    'Triangular Bandages 40"' =>          ['',2,'',['first aid']],
    'Moleskin 3" x 4"' =>                 ['',1,'',['first aid']],

    'Latex Gloves' =>                     ['',2,'latex_gloves.jpg',['first aid']],
    'Irrigation Syringe' =>               ['',1,'irrigation_syringe.jpg',['first aid']],
    'Betadine' =>                         ['',1,'betadine_swabs.jpg',['first aid']],
    'Betadine Swabs' =>                   ['',4,'betadine_swabs.jpg',['first aid']],
    'Mastisol' =>                         ['Liquid adhesive',1,'mastisol.jpg',['first aid']],
    'Cotton Swabs' =>                     ['',4,'cotton_swabs.jpg',['first aid']],
    'Alcohol Towelettes' =>               ['',4,'alcohol_towelette.jpg',['first aid']],
    'Wound Closure Strips .25" x 2"' =>   ['',8,'wound_closure_strips.jpg',['first aid']],
    'Wound Closure Strips .25" x 4"' =>   ['',8,'wound_closure_strips.jpg',['first aid']],
    'Super Glue' =>                       ['',1,'super_glue.jpg',['first aid']],

    'Bandage Scissors' =>                 ['',1,'bandage_scissors.jpg',['first aid']],
    'EMT Shears' =>                       ['',1,'trauma_shears.png',['first aid']],
    'Splinter Forceps' =>                 ['',1,'splinter_forceps.jpg',['first aid']],
    'Hemostat' =>                         ['',1,'hemostat.jpg',['first aid']],
    'Tick Forceps' =>                     ['',1,'tick_forceps.jpg',['first aid']],
    'Fresnel Lens Magnifier' =>           ['',1,'fresnel_lens.jpg',['first aid']],
    'Thermometer, standard' =>            ['',1,'thermometer.jpg',['first aid']],
    'Thermometer, hypothermia' =>         ['',1,'thermometer_hypothermia.jpg',['first aid']],
    'Sutures' =>                          ['',4,'sutures.jpg',['first aid']],

    'Triple Antibiotic Ointment' =>       ['',1,'',['first aid']],
    'Aloe Vera Gel' =>                    ['',1,'',['first aid']],
    'Acetaminophen (Tylenol)' =>          ['',24,'',['first aid']],
    'Aspirin' =>                          ['',24,'',['first aid']],
    'Ibuprofen' =>                        ['',24,'',['first aid']],
    'Pseudoephedrine' =>                  ['',24,'',['first aid']],
    'Diphenhydramine Hydrochloride' =>    ['',24,'',['first aid']],
    'Chlorpheniramine' =>                 ['',24,'',['first aid']],
    'Triamcenolone' =>                    ['',2,'',['first aid']],
    'Oral Rehydration Salts' =>           ['',2,'',['first aid']],

    'Needles, sewing' =>                  ['',3,'sewing_needles.jpg',['first aid']],
    'Razor Blades' =>                     ['',2,'razor-blades.jpg',['first aid']],
    'Safety Pins' =>                      ['',10,'safety_pins.jpg',['first aid']],
    'Surgical Tubing 36"' =>              ['',1,'surgical_tubing.jpg',['first aid']],

    'Signal Mirror' =>                    ['',1,'signal_mirror.jpg',['survival']],
    'Emergency Whistle' =>                ['',1,'emergency_whistles.jpg',['survival']],
    'Leatherman' =>                       ['',1,'leatherman.jpg',['survival']],
    'Butane Lighter' =>                   ['',1,'butane_lighter.jpg',['survival']],
    'Butane Fuel' =>                      ['',1,'butane_fuel.jpg',['survival']],
    'Survival Candle' =>                  ['',1,'survival_candle.jpg',['survival']],
    'Pocket Chainsaw' =>                  ['',1,'pocket-chainsaw.jpg',['survival']],
    'Pencil' =>                           ['',1,'pencil.jpg',['travel']],
    'Notepad' =>                          ['',1,'notepad.jpg',['travel']],

    'Hand Sanitizer' =>                   ['',1,'',['first aid']],

    # Electronics
    'AA Batteries' =>                     ['',4,'aa_batteries.jpg',['electronics']],
    'AAA Batteries' =>                    ['',6,'aaa_batteries.jpg',['electronics']],
    'C Batteries' =>                      ['',4,'c_batteries.jpg',['electronics']],
    'D Batteries' =>                      ['',4,'d_batteries.jpg',['electronics']],

    # Tools
    'Duct Tape' =>                        ['',1,'',['tools']],

    # Baby stuff
    'Diapers' =>                          ['',4,'',['baby']],
    'Wet Wipes' =>                        ['',12,'',['baby']],
    'Rash Cream' =>                       ['',1,'',['baby']],
    'Pacifier' =>                         ['',1,'',['baby']],
    'Blanket' =>                          ['',1,'',['baby']],
    'Change Pad' =>                       ['',1,'',['baby']],
    'Baby Bottle' =>                      ['',1,'',['baby']],

    # Miscellaneous
    'Ziploc Bag' =>                       ['',4,'',['miscellany']],
    'Kleenex' =>                          ['',1,'',['miscellany']],
  }
  # ['',1,'',[]]

  hash.each do |key, value|
    obj = Item.create( name: key, description: value[0], default_amount: value[1], use_list: value[3] )
    puts obj.errors.inspect if obj.errors.any?
  end
end

def seed_categories
  puts 'Seeding categories'

  Category.delete_all

  array = [
    'Camping',
    'Hiking',
    'Kayaking',
    'Rock Climbing',
    'Skiing / Snowboarding',
    'Travel'
  ]

  array.each do |category|
    obj = Category.create(name: category)
    puts obj.errors.inspect if obj.errors.any?
  end
end

seed_items
seed_categories

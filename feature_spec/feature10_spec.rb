require_relative '../lib/journey.rb'

require_relative '../lib/oystercard.rb'
require_relative '../lib/station.rb'

card = Oystercard.new
card.top_up(12)
station1 = Station.new("Kings cross", 1)
station2 = Station.new("Fish market", 3)

journey = Journey.new

card.touch_in(station1)
p journey.entry_station.name
card.touch_out(station2)
p journey.exit_station.name


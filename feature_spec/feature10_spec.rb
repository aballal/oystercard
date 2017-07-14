# Step 14
# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out

require_relative '../lib/oystercard.rb'
require_relative '../lib/station.rb'
require_relative '../lib/journey.rb'

card = Oystercard.new
card.top_up(12)
station1 = Station.new("Kings cross", 1)
station2 = Station.new("Fish market", 3)

card.touch_in(station1)
card.touch_out(station2)
p card.journeys[0].entry_station
p card.journeys[0].exit_station
p card.journeys[0].fare

card.touch_in(station1)
card.touch_out(nil)
p card.journeys[1].entry_station
p card.journeys[1].exit_station
p card.journeys[1].fare

card.touch_in(nil)
card.touch_out(station2)
p card.journeys[2].entry_station
p card.journeys[2].exit_station
p card.journeys[2].fare

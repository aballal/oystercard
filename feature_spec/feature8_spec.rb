# In order to know where I have been
# As a customer
# I want to see to all my previous trips

require_relative '../lib/oystercard.rb'
require_relative '../lib/station.rb'

p card = Oystercard.new
station1 = Station.new
station2 = Station.new
card.top_up(20)
p card.touch_in(station1)
p card.touch_out(station2)
puts "Journey from #{card.journey[0]} to #{card.journey[1]}"

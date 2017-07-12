# In order to pay for my journey
# As a customer
# When my journey is complete, I need the correct amount deducted from my card

require_relative '../lib/oystercard.rb'
require_relative '../lib/station.rb'

card = Oystercard.new
station = Station.new
card.top_up(20)
card.touch_in(station)
card.touch_out
puts "Balance: #{card.balance}"

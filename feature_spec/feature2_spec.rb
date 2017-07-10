# In order to keep using public transport
# As a customer
# I want to add money to my card

require_relative '../lib/oystercard.rb'

card = Oystercard.new
puts "Balance: #{card.balance}"
value = 20
card.top_up(value)
puts "Balance: #{card.balance}"

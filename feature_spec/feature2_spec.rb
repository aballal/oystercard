# Step 5
# In order to keep using public transport
# As a customer
# I want to add money to my card

require_relative '../lib/oystercard.rb'

card = Oystercard.new
puts "Balance: #{card.balance}"

card.top_up(20)
puts "Balance: #{card.balance}"

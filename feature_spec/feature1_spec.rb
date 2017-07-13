# Step 4
# In order to use public transport
# As a customer
# I want money on my card

require_relative '../lib/oystercard.rb'

card = Oystercard.new
puts "Balance: #{card.balance}"

card = Oystercard.new(20)
puts "Balance: #{card.balance}"

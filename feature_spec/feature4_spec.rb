# Step 7
# In order to pay for my journey
# As a customer
# I need my fare deducted from my card

require_relative '../lib/oystercard.rb'

card = Oystercard.new
card.top_up(20)
puts "Balance: #{card.balance}"

card.deduct(2)
puts "Balance: #{card.balance}"

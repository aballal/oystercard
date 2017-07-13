# Step 8
# In order to get through the barriers.
# As a customer
# I need to touch in and out.

require_relative '../lib/oystercard.rb'

card = Oystercard.new(20)
puts "Card is #{'not ' unless card.in_journey?}being used in journey"

puts 'Touched in'
card.touch_in
puts "Card is #{'not ' unless card.in_journey?}being used in journey"

puts 'Touched out'
card.touch_out
puts "Card is #{'not ' unless card.in_journey?}being used in journey"

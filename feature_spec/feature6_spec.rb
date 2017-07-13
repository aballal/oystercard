# Step 9
# In order to pay for my journey
# As a customer
# I need to have the minimum amount (£1) for a single journey.

require_relative '../lib/oystercard.rb'

card = Oystercard.new
begin
  card.touch_in
rescue => exception
  puts exception.inspect
end

card = Oystercard.new
card.top_up(5)
card.touch_in
puts 'Card touched in'

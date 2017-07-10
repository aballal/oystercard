# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card

require_relative '../lib/oystercard.rb'

card = Oystercard.new
puts "Balance: #{card.balance}"

begin
  card.top_up(100)
rescue => exception
  puts exception.inspect
end

puts "Balance: #{card.balance}"

# Step 15 and 16
# In order to be charged the correct amount
# As a customer
# I need to have the correct fare calculated

require_relative '../lib/oystercard.rb'
require_relative '../lib/station.rb'

card = Oystercard.new
station1 = Station.new("Sutton", 5)
station2 = Station.new("Victoria", 1)
station3 = Station.new("Canary Wharf", 3)

card.top_up(20)

#Testing sequence - in, out, out, in, in, out
#This should give (in,out),(out),(in),(in,out) i.e. 2 complete and 2 incomplete journeys

puts "Traveling from Sutton -> Victoria -> Canary Wharf -> Victoria -> Sutton"
puts ""

puts "I remembered to touch in and out"
puts "Touch in at #{station1.name}, zone #{station1.zone}"
puts "Touch out at #{station2.name}, zone #{station2.zone}"
puts "Starting balance: #{card.balance}"
card.touch_in(station1)
puts "Balance after touch in: #{card.balance}"
card.touch_out(station2)
puts "Ending Balance: #{card.balance}"
puts ""

puts "I forgot to touch in"
puts "Touch out at #{station3.name}, zone #{station3.zone}"
puts "Starting balance: #{card.balance}"
card.touch_out(station3)
puts "Ending Balance: #{card.balance}"
puts ""

puts "I forgot to touch out"
puts "Touch in at #{station3.name}, zone #{station3.zone}"
puts "Starting balance: #{card.balance}"
card.touch_in(station3)
puts "Ending Balance: #{card.balance}"
puts ""

puts "I remembered to touch in and out"
puts "Touch in at #{station2.name}, zone #{station2.zone}"
puts "Touch out at #{station1.name}, zone #{station1.zone}"
puts "Starting balance: #{card.balance}"
card.touch_in(station2)
puts "Balance after touch in: #{card.balance}"
card.touch_out(station1)
puts "Ending Balance: #{card.balance}"
puts ""

begin
  puts "Touch in at #{station1.name}, zone #{station1.zone}"
  card.touch_in(station1)
rescue => exception
  puts exception.inspect
end
puts ""

begin
  amount = 100
  puts "Topping up with #{amount}"
  card.top_up(amount)
rescue => exception
  puts exception.inspect
end
puts ""

amount = 20
puts "Topping up with #{amount}"
card.top_up(amount)
puts "Balance: #{card.balance}"

puts "Checking journey history"
card.journeys.each { |journey| p journey }

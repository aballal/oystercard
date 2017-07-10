require_relative '../lib/oystercard.rb'

card = Oystercard.new
p "Balance: #{card.balance}"
card.top_up(100)
p "Balance: #{card.balance}"

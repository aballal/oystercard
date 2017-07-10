require_relative '../lib/oystercard.rb'

card = Oystercard.new
p card.in_journey?
card.touch_in
p card.in_journey?
card.touch_out
p card.in_journey?

require_relative '../lib/oystercard.rb'

card = Oystercard.new
begin
  card.touch_in
rescue => exception
  puts exception.inspect
end

card2 = Oystercard.new
card2.top_up(5)
card2.touch_in
p "Touched in"

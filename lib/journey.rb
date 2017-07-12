require_relative 'oystercard'

class Journey
   attr_reader :entry_station, :exit_station, :fare

    def initialize(entry_station = nil, exit_station = nil)
        @entry_station = entry_station
        @exit_station = exit_station
        @fare = (entry_station.nil? || exit_station.nil?) ? Oystercard::PENALTY_FARE : Oystercard::MIN_FARE
    end
end

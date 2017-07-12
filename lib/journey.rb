class Journey
   attr_reader :entry_station, :exit_station
    def initialize(entry_station, exit_station = nil)
        @entry_station = entry_station
        @exit_station = exit_station
    end
    
    def set_exit_station(station)
        @exit_station = station
    end
  
end
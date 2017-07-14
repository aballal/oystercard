class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6
  PER_ZONE_FARE = 1

  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @fare = fare
  end

  def set_exit_station(station)
    @exit_station = station
  end

  def complete?
    !!(entry_station && exit_station)
  end

  def fare
    complete? ? MIN_FARE + PER_ZONE_FARE * (entry_station.zone - exit_station.zone).abs : PENALTY_FARE
  end

end

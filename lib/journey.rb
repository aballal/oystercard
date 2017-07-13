class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6

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
    !!exit_station
  end

  def fare
    (entry_station.nil? || exit_station.nil?) ? PENALTY_FARE : MIN_FARE
  end

end

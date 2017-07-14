require_relative 'journey'

class JourneyLog

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    journey = @journey_class.new(station, nil)
    @journeys << journey
    @journeys.last.entry_station
  end

  def finish(station)
    current_journey.set_exit_station(station)
  end

  def journeys
    @journeys.dup
  end

  private

  def current_journey
    if @journeys.empty? || @journeys.last.complete?
      journey = @journey_class.new
      @journeys << journey
      journey
    else
      @journeys.last
    end
  end

end

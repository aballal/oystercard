require_relative 'journey'

class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
    @journeys = []
  end

  def top_up(value)
    fail_if_above_max_balance(value)
    @balance += value
  end

  #in_journey? is not same as complete? in Journey class
  #in_journey? tells whether a journey is currently in progress
  def in_journey?
    return false if @journeys.empty?
    !@journeys.last.exit_station
  end

  def touch_in(station)
    fail_if_below_min_balance
    create_new_journey(station)
  end

  def touch_out(station)
    @journeys.last.set_exit_station(station)
    deduct(@journeys.last.fare)
  end

  def journeys(mode)
    case mode
    when :last
      @journeys[-1]
    when :check_empty
      @journeys.empty?
    else
      raise "Invalid query mode; expected ':last' or ':check_empty'"
    end
  end

  private

  def deduct(value)
    @balance -= value
  end

  def create_new_journey(station)
    journey = Journey.new(station, nil)
    @journeys << journey
    @journeys.last.entry_station
  end

  def fail_if_above_max_balance(value)
    raise "Cannot top up, balance will exceed £#{MAX_BALANCE}" if balance + value > MAX_BALANCE
  end

  def fail_if_below_min_balance
    raise "Insufficient balance, minimum £#{MIN_BALANCE} required" if balance < MIN_BALANCE
  end

end

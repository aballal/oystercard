require_relative 'journey'

class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1
  PENALTY_FARE = 6

  attr_reader :balance, :entry_station, :journeys

  def initialize(balance = 0)
    @balance = balance
    @journeys = []
  end

  def top_up(value)
    fail_if_above_max_balance(value)
    @balance += value
  end

  def in_journey?
    return false if journeys.empty?
    #!!entry_station
    !journeys.last.complete?
  end

  def touch_in(station)
    fail_if_below_min_balance
    create_new_journey(station)
    #@entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    #create_new_journey(station)
    journeys.last.set_exit_station(station)
  end

  private

  def deduct(value)
    @balance -= value
  end

  def create_new_journey(station)
    #journey = Journey.new(entry_station,station)
    journey = Journey.new(station, nil)
    @journeys << journey
    #@entry_station = nil
    #journey.exit_station
    journey.entry_station
  end

  def fail_if_above_max_balance(value)
    raise "Cannot top up, balance will exceed £#{MAX_BALANCE}" if balance + value > MAX_BALANCE
  end

  def fail_if_below_min_balance
    raise "Insufficient balance, minimum £#{MIN_BALANCE} required" if balance < MIN_BALANCE
  end

end

require_relative 'journey_log'

class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance

  def initialize(balance = 0, journey_log_class = JourneyLog)
    @balance = balance
    @journey_log = journey_log_class.new
  end

  def top_up(value)
    fail_if_above_max_balance(value)
    @balance += value
  end

  #in_journey? is not the same as !complete? in Journey class
  #in_journey? tells whether a card is in use in a current journey
  def in_journey?
    return false if @journey_log.journeys.empty?
    !@journey_log.journeys.last.exit_station
  end

  def touch_in(station)
    fail_if_below_min_balance
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.journeys.last.fare)
  end

  def journeys(mode)
    case mode
    when :last
      @journey_log.journeys.last
    when :check_empty
      @journey_log.journeys.empty?
    else
      raise "Invalid query mode; expected ':last' or ':check_empty'"
    end
  end

  private

  def deduct(value)
    @balance -= value
  end

  def fail_if_above_max_balance(value)
    raise "Cannot top up, balance will exceed £#{MAX_BALANCE}" if balance + value > MAX_BALANCE
  end

  def fail_if_below_min_balance
    raise "Insufficient balance, minimum £#{MIN_BALANCE} required" if balance < MIN_BALANCE
  end

end

class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90


  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(value)
    fail "Cannot top up, balance will exceed £#{MAX_BALANCE}" if balance + value > MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_journey
  end

  private
  attr_reader :in_journey

end

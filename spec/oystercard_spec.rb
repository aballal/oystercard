require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }

  it { is_expected.to respond_to(:balance) }

  it { is_expected.to respond_to(:in_journey?) }

  describe '#top_up' do
    it 'increases the balance by the value' do
      expect{ card.top_up 20 }.to change{ card.balance }.by 20
    end

    it "should not allow the card to exceed its maximum balance" do
      expect{ card.top_up 100 }.to raise_error "Cannot top up, balance will exceed £#{Oystercard::MAX_BALANCE}"
    end
  end

  describe '#deduct' do
    it 'decreases the balance by the value' do
      expect{ card.deduct 2 }. to change{ card.balance }.by -2
    end
  end

  describe '#touch_in' do
    it 'knows is in journey when touched in' do
      allow(card).to receive(:balance).and_return(5)
      card.touch_in
      expect(card).to be_in_journey
    end

    it "won't let user touch in unless there is sufficient balance" do
      expect{ card.touch_in }.to raise_error "Insufficient balance: minimum £#{Oystercard::MIN_BALANCE} required"
    end
  end

  describe '#touch_out' do
    it 'knows journey has completed when touched out' do
      allow(card).to receive(:balance).and_return(5)
      card.touch_in
      card.touch_out
      expect(card).not_to be_in_journey
    end
  end

  describe '#new' do
    it "takes one argument at initialization" do
      expect(Oystercard).to respond_to(:new).with(1).argument
    end

    it "should create a card with zero balance" do
      expect(card.balance).to eq 0
    end

    it "should not be in journey" do
      expect(card.in_journey?).to be false
    end

  end
end

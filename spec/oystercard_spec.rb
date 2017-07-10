require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }

  it { is_expected.to respond_to(:balance) }

  it { is_expected.to respond_to(:top_up).with(1).argument }

  describe '#top_up' do
    it 'increases the balance by the value' do
      expect{ card.top_up 20 }.to change{ subject.balance }.by 20
    end

    it "should not allow the card to exceed its maximum balance" do
      expect{ card.top_up 100 }.to raise_error "Cannot top up, balance will exceed £#{Oystercard::MAX_BALANCE}"
    end
  end

  describe '#new' do
    it "takes one argument at initialization" do
      expect(Oystercard).to respond_to(:new).with(1).argument
    end

    it "should create a card with zero balance" do
      expect(card.balance).to eq 0
    end
  end
end

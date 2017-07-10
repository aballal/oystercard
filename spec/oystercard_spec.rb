require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }

  it { is_expected.to respond_to(:balance) }

  describe '#new' do
    it "takes one argument at initialization" do
      expect(Oystercard).to respond_to(:new).with(1).argument
    end

    it "should create a card with zero balance" do
      expect(card.balance).to eq 0
    end
  end
end

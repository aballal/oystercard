require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }
  let(:station)   {double(:station)}

  it { is_expected.to respond_to(:balance) }

  it { is_expected.to respond_to(:entry_station) }

  describe '#top_up' do

    it 'increases the balance by top up value' do
      expect { card.top_up(20) }.to change { card.balance }.by 20
    end

  end

  describe '#touch_in' do
    before do
      card.top_up(20)
      card.touch_in(station)
    end

    it 'knows is in journey when touched in' do
      expect(card).to be_in_journey
    end

    it 'remembers the entry station when touched in' do
      expect(card.entry_station).to eq station
    end

  end

  describe '#touch_out' do
    before do
      card.top_up(20)
      card.touch_in(station)
    end

    it 'knows journey has completed when touched out' do
      card.touch_out
      expect(card).not_to be_in_journey
    end

    it 'forgets the entry station when touched out' do
      expect { card.touch_out }.to change {card.entry_station}.to nil
    end

    it 'reduces balance by minimum fare' do
      expect { card.touch_out }.to change { card.balance }.by(-Oystercard::MIN_FARE)
    end

  end

  describe '#new' do
    it 'takes one argument at initialization' do
      expect(Oystercard).to respond_to(:new).with(1).argument
    end

    it 'should create a card with zero balance' do
      expect(card.balance).to eq 0
    end

    it 'should not be in journey' do
      expect(card.in_journey?).to be false
    end
  end

  describe 'errors' do

    it 'should not allow the card to exceed its maximum balance' do
      message = "Cannot top up, balance will exceed £#{Oystercard::MAX_BALANCE}"
      expect { card.top_up(100) }.to raise_error message
    end

    it 'will not let user touch in unless there is sufficient balance' do
      message = "Insufficient balance, minimum £#{Oystercard::MIN_BALANCE} required"
      expect { card.touch_in(station) }.to raise_error message
    end

  end

end

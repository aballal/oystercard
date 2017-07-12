require 'oystercard'
require 'journey'

describe Oystercard do
  subject(:card) { described_class.new }
  let(:station1) {double(:station, :name => "Kings Cross", :zone => 1)}
  let(:station2) {double(:station, :name => "Fish Market", :zone => 3)}
  let(:journey)  {double(:journey, :entry_station => station1, :exit_station => station2)}

  describe '#top_up' do

    it 'increases the balance by top up value' do
      expect { card.top_up(20) }.to change { card.balance }.by 20
    end

  end

  describe '#touch_in' do
    before do
      card.top_up(20)
      card.touch_in(station1)
    end

    it 'knows is in journey when touched in' do
      expect(card).to be_in_journey
    end

    it 'remembers the entry station when touched in' do
      expect(card.journeys[0].entry_station).to eq station1
    end

  end

  describe '#touch_out' do
    before do
      card.top_up(20)
      card.touch_in(station1)
      card.touch_out(station2)
    end

    it 'knows journey has completed when touched out' do
      expect(card).not_to be_in_journey
    end
=begin
    it 'forgets the entry station when touched out' do
      expect(card.journeys[0].entry_station).to be_nil
    end
=end
    it 'reduces balance by minimum fare' do
      expect(card.balance).to eq (20-Oystercard::MIN_FARE)
    end

    it 'remembers the journey start station' do
      expect(card.journeys[0].entry_station).to eq journey.entry_station
    end

    it 'remembers the journey end station' do
      expect(card.journeys[0].exit_station).to eq journey.exit_station
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
      card = Oystercard.new
      allow(journey).to receive(:complete?).and_return true
      expect(card.in_journey?).to be false
    end

    it 'should not have a journey' do
      expect(card.journeys).to be_empty
    end
  end

  describe 'errors' do

    it 'should not allow the card to exceed its maximum balance' do
      message = "Cannot top up, balance will exceed £#{Oystercard::MAX_BALANCE}"
      expect { card.top_up(100) }.to raise_error message
    end

    it 'will not let user touch in unless there is sufficient balance' do
      message = "Insufficient balance, minimum £#{Oystercard::MIN_BALANCE} required"
      expect { card.touch_in(station1) }.to raise_error message
    end

  end

end

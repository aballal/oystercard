require 'journey'

describe Journey do
  subject(:new_journey) {described_class.new}
  subject(:journey) {described_class.new(station1, station2)}
  let(:station1) {double(:station, :name => "Kings Cross", :zone => 1)}
  let(:station2) {double(:station, :name => "Canary Wharf", :zone => 2)}
  let(:station3) {double(:station, :name => "Stratford", :zone => 3)}

  describe '#entry_station' do
    it 'is empty for a new journey' do
      expect(new_journey.entry_station).to be_nil
    end

    it 'tells where the journey started' do
      expect(journey.entry_station).to eq station1
    end
  end

  describe '#exit_station' do
    it 'is empty for a new journey' do
      expect(new_journey.exit_station).to be_nil
    end

    it 'tells where the journey ended' do
      expect(journey.exit_station).to eq station2
    end
  end

  describe '#set_exit_station' do
    it 'sets the exit station' do
      expect { journey.set_exit_station(station3) }.to change { journey.exit_station }.to station3
    end
  end

  describe '#complete?' do
    it 'tells that a new journey is incomplete' do
      expect(new_journey.complete?).to eq false
    end

    it 'tells that a journey is incomplete when it has only entry station' do
      journey = Journey.new(station1, nil)
      expect(journey.complete?).to eq false
    end

    it 'tells that a journey is incomplete when it has only exit station' do
      journey = Journey.new(nil, station2)
      expect(journey.complete?).to eq false
    end

    it 'tells that a journey is complete when it has both entry and exit stations' do
      journey = Journey.new(station1, station2)
      expect(journey.complete?).to eq true
    end
  end

  describe '#fare' do
    it 'has a penalty fare for a new journey' do
      expect(new_journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'should charge the appropriate fare for a complete journey' do
      journey = Journey.new(station1,station3)
      expect(journey.fare).to eq Journey::MIN_FARE + Journey::PER_ZONE_FARE * 2
    end

    it 'should charge the penalty fare when no entry station' do
      journey = Journey.new(nil, station2)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'should charge the penalty fare when no exit station' do
      journey = Journey.new(station1)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end

end

require 'journey'

describe Journey do
  subject(:journey) {described_class.new(station1, station2)}
  let(:station1) {double(:station, :name => "Kings Cross", :zone => 1)}
  let(:station2) {double(:station, :name => "Canary Wharf", :zone => 2)}
  let(:station3) {double(:station, :name => "Stratford", :zone => 3)}

  describe '#entry_station' do
    it 'tells the station where the journey started' do
      expect(journey.entry_station).to eq station1
    end
  end

  describe '#exit_station' do
    it 'tells the station where the journey ended' do
      expect(journey.exit_station).to eq station2
    end
  end

  describe '#set_exit_station' do
    it 'sets the exit station' do
      expect { journey.set_exit_station(station3) }.to change { journey.exit_station }.to station3
    end
  end

  describe '#complete?' do
    it 'tells if the journey is complete' do
      journey = Journey.new(station1, nil)
      expect(journey.complete?).to eq false
    end
  end

  describe '#fare' do
    it 'can calculate a fare' do
      expect(journey.fare).to eq Journey::MIN_FARE
    end

    it 'should charge a penelty fare for no exit station' do
      journey = Journey.new(station1)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'should charge a penelty fare for no entry station' do
      journey = Journey.new(nil, station2)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end
end

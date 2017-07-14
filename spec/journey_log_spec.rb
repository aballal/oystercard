require 'journey_log'

describe JourneyLog do
  subject(:journey_log) { described_class.new(Journey) }
  subject(:journey) {described_class.new(station1, station2)}
  let(:station1) {double(:station, :name => "Kings Cross", :zone => 1)}
  let(:station2) {double(:station, :name => "Canary Wharf", :zone => 2)}

  it 'has no journeys to begin with' do
    expect(journey_log.journeys).to be_empty
  end

  it 'can start a journey' do
    journey_log.start(station1)
    expect(journey_log.journeys.last.entry_station).to eq station1
  end

  it 'can finish a journey' do
    journey_log.start(station1)
    journey_log.finish(station2)
    expect(journey_log.journeys.last.exit_station).to eq station2
  end

  it 'a finish without a start will create an incomplete journey' do
    journey_log.finish(station2)
    expect(journey_log.journeys.last.exit_station).to eq station2
  end

end

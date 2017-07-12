require 'journey'

describe Journey do
    subject(:journey) {described_class.new(station1, station2)}
    let(:station1) {double(:station, :name => "Kings Cross", :zone => 1)}
    let(:station2) {double(:station, :name => "Fish Market", :zone => 3)}
    let(:station3) {double(:station, :name => "Victoria", :zone => 2)}

    describe '#entry_station' do
        it 'tell us the station the entry station' do
            expect(journey.entry_station).to eq station1
        end
    end

    describe '#exit_station' do
        it 'tell us the station we have left' do
            expect(journey.exit_station).to eq station2
        end
    end

   describe '#set_exit_station' do
       it 'allows us to set an exit station' do
           expect{journey.set_exit_station(station3)}.to change{journey.exit_station}.to station3
       end
   end

   describe '#fare' do
     it 'can calculate a fare' do
       expect(journey.fare).to eq Oystercard::MIN_FARE
     end
   end

end

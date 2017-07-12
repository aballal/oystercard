require 'station'

describe Station do
  subject(:station) {described_class.new("Kings Cross", 1)}

  describe '#new' do
    it 'can be named when created' do
      expect(station.name).to eq "Kings Cross"
    end

    it 'can have a zone when created' do
      expect(station.zone).to eq 1
    end
  end

end

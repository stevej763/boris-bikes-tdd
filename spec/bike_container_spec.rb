require 'bike_container'
require 'docking_station'
require 'garage'

shared_examples_for 'a bike container' do
  let(:bike) {double :bike}
  describe '#receive_bikes' do
    it 'receives an array of bikes' do
      bikes = [bike]
      subject.receive_bikes(bikes)
      expect(subject.bikes).to eq bikes
    end
  end
end

describe DockingStation do
  it_behaves_like 'a bike container'
end

describe Garage do
  it_behaves_like 'a bike container'
end

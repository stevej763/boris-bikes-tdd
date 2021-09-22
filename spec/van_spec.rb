require 'van'

describe Van do
  let(:broken_bike) {double(:broken_bike)}
  let(:docking_station) { double :docking_station, release_broken_bikes: [broken_bike] }

  describe "#collect_broken_bikes" do
    it { is_expected.to respond_to(:collect_broken_bikes) }

    it "collects broken bikes from a docking station" do
      subject.collect_broken_bikes(docking_station)
      expect(subject.bikes).to include(broken_bike)
    end
  end
end
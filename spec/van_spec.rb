require 'van'

describe Van do
  let(:broken_bike) {double(:broken_bike)}
  let(:broken_bike_2) {double(:broken_bike_2)}
  let(:fixed_bike) {double(:fixed_bike)}
  let(:fixed_bike_2) {double(:fixed_bike_2)}

  let(:docking_station) { double :docking_station, release_broken_bikes: [broken_bike, broken_bike_2] }
  let(:garage) { double :garage, receive_bikes: [broken_bike, broken_bike_2], release_fixed_bikes: [fixed_bike, fixed_bike_2] }

  describe "#collect_broken_bikes" do
    it { is_expected.to respond_to(:collect_broken_bikes) }

    it "collects broken bikes from a docking station" do
      subject.collect_broken_bikes(docking_station)
      expect(subject.bikes).to include(broken_bike, broken_bike_2)
    end
  end

  describe "#deliver_broken_bikes" do
    it "delivers broken bikes to a garage" do
      subject.collect_broken_bikes(docking_station)
      expect(garage).to receive(:receive_bikes).with([broken_bike, broken_bike_2])
      subject.deliver_broken_bikes(garage)
      expect(subject.bikes).to eq []
    end
  end

  describe "#collect_fixed_bikes" do
    it "collects fixed bikes from a garage" do
      subject.collect_fixed_bikes(garage)
      expect(subject.bikes).to include(fixed_bike, fixed_bike_2)
    end
  end
end
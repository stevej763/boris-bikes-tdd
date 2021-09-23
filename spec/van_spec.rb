require 'van'

describe Van do
  let(:broken_bike) {double(:broken_bike)}
  let(:broken_bike_2) {double(:broken_bike_2)}
  let(:fixed_bike) {double(:fixed_bike)}
  let(:fixed_bike_2) {double(:fixed_bike_2)}

  let(:docking_station) { double :docking_station, release_broken_bikes: [broken_bike, broken_bike_2], class: DockingStation}
  let(:garage) { double :garage, receive_bikes: [broken_bike, broken_bike_2], release_fixed_bikes: [fixed_bike, fixed_bike_2], class: Garage }

  describe "#collect_bikes" do
    it { is_expected.to respond_to(:collect_bikes) }

    it "collects broken bikes from a docking station" do
      subject.collect_bikes(docking_station)
      expect(subject.bikes).to include(broken_bike, broken_bike_2)
    end

    it "collects fixed bikes from a garage" do
      subject.collect_bikes(garage)
      expect(subject.bikes).to include(fixed_bike, fixed_bike_2)
    end

    it "doesn't collect bikes if location is an invalid location" do
      expect {subject.collect_bikes("Invalid")}.to raise_error("Invalid location")
    end
  end

  describe "#deliver_bikes" do
    it "delivers broken bikes to a garage" do
      subject.collect_bikes(docking_station)
      expect(garage).to receive(:receive_bikes).with([broken_bike, broken_bike_2])
      subject.deliver_bikes(garage)
      expect(subject.bikes).to eq []
    end

    it "delivers fixed bikes to a docking station" do
      subject.collect_bikes(garage)
      expect(docking_station).to receive(:receive_bikes).with([fixed_bike, fixed_bike_2])
      subject.deliver_bikes(docking_station)
      expect(subject.bikes).to eq []
    end
  end
end
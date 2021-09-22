require 'van'

describe Van do
  let(:broken_bike) {instance_double(Bike)}
  let(:broken_bike_2) {instance_double(Bike)}
  let(:docking_station) { double :docking_station, release_broken_bikes: [broken_bike, broken_bike_2] }
  let(:garage) { double :garage, receive_bikes: [broken_bike, broken_bike_2] }

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
end
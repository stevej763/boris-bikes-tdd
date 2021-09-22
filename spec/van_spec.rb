require 'van'

describe Van do
  let(:broken_bike) {double(:broken_bike)}
  let(:docking_station) { double :docking_station, release_broken_bikes: [broken_bike] }
  let(:garage) { double :garage, receive_bikes: [broken_bike] }

  describe "#collect_broken_bikes" do
    it { is_expected.to respond_to(:collect_broken_bikes) }

    it "collects broken bikes from a docking station" do
      subject.collect_broken_bikes(docking_station)
      expect(subject.bikes).to include(broken_bike)
    end
  end

  describe "#deliver_broken_bikes" do
    it "delivers broken bikes to a garage" do
      expect(garage).to receive(:receive_bikes)

      subject.deliver_broken_bikes(garage)
      expect(subject.bikes).to eq []
    end
  end
end
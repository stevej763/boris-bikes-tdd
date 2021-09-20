require 'docking_station'
require 'bike'

describe DockingStation do
  describe "release_bike method" do
    it { is_expected.to respond_to(:release_bike)}

    it "releases a working bike" do
      result = subject.release_bike
      expect(result.class).to eq Bike
      expect(result.working?).to eq true
    end
  end

  describe "dock_bike method" do
    it { is_expected.to respond_to(:dock_bike)}

    it "a user can return a bike" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.bikes).to include?(bike)
    end
  end
end
require 'docking_station'

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
  end
end
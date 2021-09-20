require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike)}

  describe "release_bike method" do
    it "releases a working bike" do
      result = subject.release_bike
      expect(result.class).to eq Bike
      expect(result.working?).to eq true
    end
  end
end
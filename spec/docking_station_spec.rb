require 'docking_station'
require 'bike'

describe DockingStation do
  describe "release_bike method" do
    it { is_expected.to respond_to(:release_bike)}

    it "releases a working bike" do
      subject.dock_bike(Bike.new)
      result = subject.release_bike
      expect(result.class).to eq Bike
      expect(result.working?).to eq true
    end

    it "doesn't let the user release a bike if none are present" do
      expect {subject.release_bike}.to raise_error("No available bikes")
    end
  end

  describe "dock_bike method" do
    it { is_expected.to respond_to(:dock_bike)}

    it "a user can return a bike" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.bikes).to include(bike)
    end

    it "a user cannot return a bike if the docking station is full" do
      # Fill to capacity
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock_bike(Bike.new)  
      end

      expect {subject.dock_bike(Bike.new)}.to raise_error("Docking station full")
    end
  end
end
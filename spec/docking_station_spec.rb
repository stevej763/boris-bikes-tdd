require 'docking_station'
require 'bike'

describe DockingStation do
  describe "release_bike method" do
    it { is_expected.to respond_to(:release_bike)}

    it "releases a working bike" do
      subject.dock_bike(Bike.new)
      result = subject.release_bike
      expect(result.class).to eq Bike
      expect(result.working).to eq true
    end

    it "doesn't let the user release a bike if none are present" do
      expect {subject.release_bike}.to raise_error("No available bikes")
    end

    it "doesn't release a broken bike" do
      bike_one = Bike.new
      bike_two = Bike.new
      bike_three = Bike.new

      
      subject.dock_bike(bike_two, false)
      subject.dock_bike(bike_one)

      released_bike = subject.release_bike

      expect(released_bike).to eq bike_one
      expect(released_bike.working).to eq true
      expect(subject.bikes).to include bike_two
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
      subject.capacity.times do
        subject.dock_bike(Bike.new)  
      end

      expect {subject.dock_bike(Bike.new)}.to raise_error("Docking station full")
    end

    it "a user cannot return a bike if the docking station is full with custom capacity" do
      docking_station = DockingStation.new(10)
      
      # Fill to capacity
      docking_station.capacity.times do
        docking_station.dock_bike(Bike.new)  
      end

      expect {docking_station.dock_bike(Bike.new)}.to raise_error("Docking station full")
    end

    it 'a user can return a broken bike' do
      bike = Bike.new
      subject.dock_bike(bike, false)
      expect(subject.bikes).to include(bike)
      expect(bike.working).to eq(false)
    end
  end

  describe "#initialize" do
    it "can initialise docking station with specified capacity" do
      docking_station = DockingStation.new(10)
      expect(docking_station.capacity).to eq 10
    end
  end
end
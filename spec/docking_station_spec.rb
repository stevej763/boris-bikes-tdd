require 'docking_station'

describe DockingStation do
  let(:working_bike) {double :working_bike, working: true, class: Bike}
  let(:broken_bike) {double :broken_bike, working: false, "working=": false}

  describe "release_bike method" do

    it { is_expected.to respond_to(:release_bike)}

    it "releases a working bike" do
      subject.dock_bike(working_bike)

      result = subject.release_bike
      expect(result.class).to eq Bike
      expect(result.working).to eq true
    end

    it "doesn't let the user release a bike if none are present" do
      expect {subject.release_bike}.to raise_error("No available bikes")
    end

    context "doesn't release a broken bike" do
      
      it "when broken bike added first" do
        subject.dock_bike(broken_bike, false)
        subject.dock_bike(working_bike)
  
        expect(subject.release_bike).to eq working_bike
        expect(subject.bikes).to include broken_bike
      end

      it "when wokring bike added first" do
        subject.dock_bike(working_bike)
        subject.dock_bike(broken_bike, false)
      
        expect(subject.release_bike).to eq working_bike
        expect(subject.bikes).to include broken_bike
      end
    end

    it "raises an error when there are no working bikes" do
      subject.dock_bike(broken_bike, false)

      expect {subject.release_bike}.to raise_error("No available bikes")
      expect(subject.bikes).to include broken_bike
    end
  end

  describe "dock_bike method" do
    it { is_expected.to respond_to(:dock_bike)}

    it "a user can return a bike" do
      subject.dock_bike(working_bike)
      expect(subject.bikes).to include(working_bike)
    end

    it "a user cannot return a bike if the docking station is full" do
      # Fill to capacity
      subject.capacity.times do
        subject.dock_bike(working_bike)  
      end

      expect {subject.dock_bike(working_bike)}.to raise_error("Docking station full")
    end

    it "a user cannot return a bike if the docking station is full with custom capacity" do
      docking_station = DockingStation.new(10)
      
      # Fill to capacity
      docking_station.capacity.times do
        docking_station.dock_bike(working_bike)
      end

      expect {docking_station.dock_bike(working_bike)}.to raise_error("Docking station full")
    end

    it 'a user can return a broken bike' do
      subject.dock_bike(broken_bike, false)
      expect(subject.bikes).to include(broken_bike)
    end
  end

  describe "#initialize" do
    it "can initialise docking station with specified capacity" do
      docking_station = DockingStation.new(10)
      expect(docking_station.capacity).to eq 10
    end
  end

  describe '#release_broken_bikes' do
    it "doesn't let the user release a broken bike if none are present" do
      subject.dock_bike(working_bike)
      expect {subject.release_broken_bikes}.to raise_error("No broken bikes")
    end
  end
end
require 'garage'
require 'bike'

describe Garage do
    bike_1 = Bike.new
    bike_2 = Bike.new
    bike_1.working = false
    bike_2.working = false

  describe '#receive_bikes' do
    it 'receives an array of bikes' do
      bike_array = [bike_1, bike_2]
      subject.receive_bikes(bike_array)
      expect(subject.bikes).to eq bike_array
    end
  end

  describe '#fix_bikes' do
    it 'fixes all the bikes' do
      bike_array = [bike_1, bike_2]
      subject.receive_bikes(bike_array)
      subject.fix_bikes
      expect(subject.bikes[0].working).to eq true
      expect(subject.bikes[1].working).to eq true
    end
  end

  describe '#release_fixed_bikes' do
    it "releases fixed bikes" do    
      bike_array = [bike_1, bike_2]
      subject.receive_bikes(bike_array)
      subject.fix_bikes

      expect(subject.release_fixed_bikes).to eq bike_array
      expect(subject.bikes).to eq []
    end

    it "throws if no fixed bikes to release" do    
      expect {subject.release_fixed_bikes}.to raise_error("No fixed bikes")
    end
  end
end
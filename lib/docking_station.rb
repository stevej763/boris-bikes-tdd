require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def release_bike
    Bike.new
  end

  def dock_bike(bike)
    @bikes.push(bike)
  end
end
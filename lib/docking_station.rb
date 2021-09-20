require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def release_bike
    raise "No available bikes" if @bikes.empty?
    return @bikes.pop
  end

  def dock_bike(bike)
    raise "Docking station full" if !@bikes.empty?
    @bikes.push(bike)
  end
end
require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def release_bike
    raise "No available bikes" if empty?
    return @bikes.pop
  end

  def dock_bike(bike)
    raise "Docking station full" if full?
    @bikes.push(bike)
  end

  private
  
  def full?
    @bikes.count == 20
  end

  def empty?
    @bikes.empty?
  end

  
end
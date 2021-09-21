require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  attr_reader :bikes, :capacity

  def release_bike
    raise "No available bikes" if empty?
    bike = @bikes.find {|bike| bike.working == true}
    @bikes.delete(bike)
    return bike
  end

  def dock_bike(bike, is_working = true)
    raise "Docking station full" if full?
    bike.working = false if !is_working
    @bikes.push(bike)
  end

  private
  
  def full?
    @bikes.count == @capacity
  end

  def empty?
    @bikes.empty?
  end

end
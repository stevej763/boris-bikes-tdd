require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  attr_reader :bikes, :capacity

  def release_bike
    raise "No available bikes" if no_available_bikes?
    get_working_bike()
  end

  def dock_bike(bike, is_working = true)
    raise "Docking station full" if full?
    update_bike_status(bike, is_working) 
    @bikes.push(bike)
  end

  private

  def find_working_bike
    @bikes.find {|bike| bike.working}
  end

  def get_working_bike
    @bikes.delete(find_working_bike)
  end

  def update_bike_status(bike, is_working)
    bike.working = false if !is_working
  end
  
  def full?
    @bikes.count == @capacity
  end

  def no_available_bikes?
    @bikes.empty? || find_working_bike == nil
  end

end
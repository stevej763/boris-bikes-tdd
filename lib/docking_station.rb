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
    get_working_bike
  end

  def release_broken_bikes
    raise "No broken bikes" if no_broken_bikes?
    get_all_broken_bikes
  end

  def dock_bike(bike, is_working = true)
    raise "Docking station full" if full?
    update_bike_status(bike, is_working) 
    @bikes.push(bike)
  end

  def receive_fixed_bikes(fixed_bikes)
    @bikes += fixed_bikes
  end

  private

  def find_broken_bikes
    bikes.find_all {|bike| !bike.working}
  end

  def no_broken_bikes?
    find_broken_bikes.empty?
  end

  def find_working_bike
    @bikes.find {|bike| bike.working}
  end

  def get_working_bike
    @bikes.delete(find_working_bike)
  end

  def get_all_broken_bikes
    broken_bikes = []
    find_broken_bikes.each {|bike| broken_bikes << @bikes.delete(bike)}
    broken_bikes
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
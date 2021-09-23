require 'bike_container'

class Garage
  include BikeContainer

  def initialize
    @bikes = []
  end

  attr_reader :bikes
  
  def fix_bikes
    @bikes.each { |bike| bike.working = true }
  end

  def release_fixed_bikes
    raise "No fixed bikes" if no_fixed_bikes?
    get_all_fixed_bikes
  end

  private

  def get_all_fixed_bikes
    fixed_bikes = []
    find_fixed_bikes.each {|bike| fixed_bikes << @bikes.delete(bike)}
    fixed_bikes
  end

  def find_fixed_bikes
    bikes.find_all {|bike| bike.working}
  end

  def no_fixed_bikes?
    find_fixed_bikes.empty?
  end

end
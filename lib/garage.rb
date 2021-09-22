class Garage

  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def receive_bikes(broken_bikes)
    @bikes += broken_bikes
  end
  
  def fix_bikes
    @bikes.each { |bike| bike.working = true }
  end

end
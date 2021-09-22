class Van

  def initialize
    @bikes = []
  end

  attr_accessor :bikes

  def collect_broken_bikes(docking_station)
    @bikes += docking_station.release_broken_bikes
  end
  
  def deliver_broken_bikes(garage)
    garage.receive_bikes(@bikes)
    @bikes = []
  end

end

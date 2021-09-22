class Van

  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def collect_broken_bikes(docking_station)
    @bikes += docking_station.release_broken_bikes
  end
  
  def deliver_broken_bikes(garage)
    garage.receive_bikes(@bikes)
    @bikes = []
  end

  def collect_fixed_bikes(garage)
    @bikes += garage.release_fixed_bikes
  end

  def deliver_fixed_bikes(docking_station)
    docking_station.receive_bikes(@bikes)
    @bikes = []
  end

end

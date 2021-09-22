class Van

  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def collect_broken_bikes(docking_station)
    @bikes += docking_station.release_broken_bikes
  end

end

class Van

  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def deliver_bikes(location)
    location.receive_bikes(@bikes)
    @bikes = []
  end

  def collect_bikes(location)
    if location.class == Garage
      @bikes += location.release_fixed_bikes  
    elsif location.class == DockingStation
      @bikes += location.release_broken_bikes
    else 
      raise "Invalid location"
    end
  end
end

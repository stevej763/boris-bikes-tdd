class Van
  def collect_broken_bikes(docking_station)
    # Call a method on the docking station to release all broken bikes
    # Store this as an instance variable on the Van
    # Implement `docking_station#release_broken_bikes` method
    @bikes = docking_station.release_broken_bikes
  end
end
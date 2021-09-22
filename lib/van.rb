class Van

  def initialize
    @bikes = []
  end

  attr_reader :bikes

  def collect_broken_bikes(docking_station)
    @bikes += docking_station.release_broken_bikes
  end
  
  def deliver_broken_bikes(garage)
    bikes_to_fix = []
    puts "van: #{@bikes}"

    @bikes.each do |bike|
      puts "bike to delete: #{bike}"
      bikes_to_fix << bike
      @bikes.delete(bike)
    end
    puts "van: #{@bikes}"
    puts bikes_to_fix
    garage.receive_bikes(bikes_to_fix)
  end

end

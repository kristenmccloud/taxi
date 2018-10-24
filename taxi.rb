class Taxi
  attr_accessor :driver, :seats, :make, :model, :license, :riders

  def initialize(driver, seats, make, model, license)
    @driver = driver
    @seats = seats
    @make = make
    @model = model
    @license = license
    @riders = []
  end

  def pickup(nameArr)
    @riders << nameArr
  end

end


class Taxi_Service
  attr_accessor :riderQueue, :taxiQueue

  def initialize
    @riderQueue = []
    @taxiQueue = []
  end

  def addRider (nameArr)
    @riderQueue << nameArr
  end

  def addTaxi (taxi)
    @taxiQueue << taxi
  end

  # method that adds all queued riders to taxis until seats are full
  def assignTaxi#(names)
    # taking the riders in @riderQueue and adding them to each taxi
    # if the number of seats in taxi, is greater than the number of riders, add riders to taxi. Until number of seats equals number of riders.
    taxi = Taxi.new("Bob", 4, "Honda", "Civic", 1234)
    while taxi.seats > 0
      p 'picking up rider'
      #select the first rider
      rider = @riderQueue[0]
      #put first rider in a taxi
      taxi.pickup(rider)
      #update number of seats in taxi
      taxi.seats -= 1
      #take the rider out of the queue
      @riderQueue.shift
    end
    p taxi
    p @riderQueue
  end


end


new_service = Taxi_Service.new
new_taxi = Taxi.new("Bobby", 5, "Toyota", "Corola", 5432)

# p new_taxi.pickup("Greg")
# p new_taxi.pickup("Maddie")
# p new_taxi.pickup("m")
# p new_taxi.pickup("v")
# p new_taxi.pickup("d")
# p new_taxi.pickup("d")

p new_service.addTaxi(new_taxi)

p new_service.addRider("Greg")
p new_service.addRider("Maddie")
p new_service.addRider("m")
p new_service.addRider("v")
p new_service.addRider("d")
p new_service.addRider("d")
p new_service.addRider("Max")

p new_service.assignTaxi

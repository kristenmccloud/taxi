require 'rspec'
require_relative 'taxi'

describe Taxi do

  it "is a thing" do
    expect{Taxi.new("Bob", 4, "Honda", "Civic", 1234)}.to_not raise_error
  end

  it "has a driver" do
    a_taxi = Taxi.new("Bob", 4, "Honda", "Civic", 1234)
    expect(a_taxi.driver).to be_a String
  end

  it "has a riders array" do
    a_taxi = Taxi.new("Bob", 4, "Honda", "Civic", 1234)
    expect(a_taxi.riders).to be_a Array
  end

  it "adds riders' names to riders array" do
    a_taxi = Taxi.new("Bob", 4, "Honda", "Civic", 1234)
    expect(a_taxi.pickup("rider")).to start_with "rider"
  end
end



describe Taxi_Service do

  it "is a thing" do
    expect{Taxi_Service.new}.to_not raise_error
  end

  it "has a riderQueue" do
    a_Taxi_Service = Taxi_Service.new
    expect(a_Taxi_Service.riderQueue).to be_a Array
  end

  it "has a taxiQueue" do
    a_Taxi_Service = Taxi_Service.new
    expect(a_Taxi_Service.taxiQueue).to be_a Array
  end

  it "adds riders to riderQueue" do
    a_Taxi_Service = Taxi_Service.new
    expect(a_Taxi_Service.addRider("rider")).to start_with "rider"
  end

  it "adds taxi object to taxiQueue" do
    a_Taxi_Service = Taxi_Service.new
    expect(a_Taxi_Service.addTaxi("taxi")).to start_with "taxi"
  end

  it "adds riders to riders array in class Taxi" do
    a_Taxi_Service = Taxi_Service.new
    a_Taxi_Service.addRider('rider')
    a_taxi = Taxi.new("Bob", 4, "Honda", "Civic", 1234)
    a_Taxi_Service.addTaxi(a_taxi)
    a_Taxi_Service.assignTaxi
    # expect(a_Taxi_Service.assignTaxi).to start_with "rider"
    # a_Taxi_Service.assignTaxi("rider")
    # expect(a_taxi.riders).to start_with "rider"
  end

  it "stops adding riders when seats equals zero" do
    a_Taxi_Service = Taxi_Service.new
    a_Taxi_Service.addRider('rider')
    a_Taxi_Service.addRider('rider2')
    a_taxi = Taxi.new("Bob", 1, "Honda", "Civic", 1234)
    a_Taxi_Service.addTaxi(a_taxi)
    a_Taxi_Service.assignTaxi
    expect(a_Taxi_Service.riderQueue).to start_with "rider2"
  end
end

# Step 1
# To begin our taxi service, we need to define what a Taxi is in our app.
#
# For our purposes, a taxi needs to have the following attributes:
#
# driver (full name)
# number of free seats
# car make
# car model
# car license plate
# a riders list (starts off as an empty array)
# a method pickup that adds a name to the riders list



# Step 2
# Great, we have defined what a taxi is and given it some basic functionality.
#
# Next we need to create the Taxi Service.
#
# Taxi Service will be a class with the following attributes:
#
# riderQueue (starts off as an empty array)
# taxiQueue (starts off as an empty array)
# an addRider method that adds a name to the riderQueue array
# an addTaxi method that adds a Taxi object to the taxiQueue
# an assignTaxi method that adds all queued riders to taxis -- adding people to each taxi until all of its seats are full
# Step 3
# We now have the beginnings of a Taxi Service! Try it out by creating a new instance of your service, then a handfull of taxi instances. Try running your taxi service with some taxis and people!
#
# Stretch
# Think about other functionalities this program might need (maybe a dropOff method, sorting people by destination, etc...)

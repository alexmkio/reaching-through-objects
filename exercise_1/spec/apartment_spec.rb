require 'rspec'
require_relative '../lib/apartment'
require_relative '../lib/room'

RSpec.describe Apartment do
  it 'can tell whether it\'s rented' do
    apartment = Apartment.new

    expect(apartment.is_rented?).to be false
  end

  it 'can be rented' do
    apartment = Apartment.new
    apartment.rent

    expect(apartment.is_rented?).to be true
  end

  it 'can add rooms' do
    apartment = Apartment.new
    bathroom = Room.new("bathroom")

    expect(apartment.rooms.length).to eq(0)

    apartment.add_room(bathroom)
    apartment.add_room(Room.new("laundry"))
    apartment.add_room(Room.new("kitchen"))
    apartment.add_room(Room.new("bedroom"))
    expect(apartment.rooms.length).to eq(4)
  end

  it 'can have up to 4 rooms' do
    apartment = Apartment.new
    bathroom = Room.new("bathroom")

    expect(apartment.add_room(bathroom)).to eq('Room added')
    expect(apartment.add_room(Room.new("laundry"))).to eq('Room added')
    expect(apartment.add_room(Room.new("kitchen"))).to eq('Room added')
    expect(apartment.add_room(Room.new("bedroom"))).to eq('Room added')

    expect(apartment.add_room(Room.new("5th Room"))).to eq("You've reached the maximum number of rooms this apartment can have")
    expect(apartment.rooms.length).to eq(4)
  end

  it 'can list the names of the rooms in alphabetical order' do
    apartment = Apartment.new
    apartment.add_room(Room.new("bathroom"))
    apartment.add_room(Room.new("laundry"))
    apartment.add_room(Room.new("kitchen"))
    apartment.add_room(Room.new("bedroom"))

    expect(apartment.list_rooms_by_name_alphabetically).to eq(["bathroom", "bedroom", "kitchen", "laundry"])
  end
end
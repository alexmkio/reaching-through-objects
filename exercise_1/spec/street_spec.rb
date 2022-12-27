require 'rspec'
require_relative '../lib/street'
require_relative '../lib/building'
require_relative '../lib/room'

RSpec.describe Street do
  it 'should have a name' do
    adlington = Street.new("Adlington Road")

    expect(adlington.name).to eq('Adlington Road')
  end

  it 'should be able to add buildings you own' do
    adlington = Street.new("Adlington Road")
    bldg = Building.new("623", "Savills Apartment Building")

    expect(adlington.buildings.length).to eq(0)

    adlington.add_building(bldg)
    expect(adlington.buildings.length).to eq(1)
    expect(adlington.buildings).to eq([bldg])
  end

  it 'should be able to list the buildings you own alphabetically' do
    zebra = Building.new("123", "Zebra Apartments")
    savills = Building.new("623", "Savills Apartment Building")
    adlington = Street.new("Adlington Road")
    adlington.add_building(zebra)
    adlington.add_building(savills)

    expect(adlington.list_buildings_by_name_alphabetically).to eq(["Savills Apartment Building", "Zebra Apartments"])
  end

  it 'should be able to state the # of apartments that are not currently rented' do
    zebra = Building.new("123", "Zebra Apartments")
    zebra.add_apartment(Apartment.new)
    zebra.add_apartment(Apartment.new)
    adlington = Street.new("Adlington Road")
    adlington.add_building(zebra)

    expect(adlington.number_of_available_apartments).to eq(2)
    
    savills = Building.new("623", "Savills Apartment Building")
    savills.add_apartment(Apartment.new)
    adlington.add_building(savills)

    expect(adlington.number_of_available_apartments).to eq(5)
  end

  it 'should be able to list the names of the Buildings that have available Apartments' do
    bathroom = Room.new("bathroom")
    laundry = Room.new("laundry")
    bedroom = Room.new("bedroom")
    kitchen = Room.new("kitchen")

    apartment_1 = Apartment.new
    apartment_1.add_room(bathroom)
    apartment_1.add_room(bedroom)
    apartment_1.add_room(kitchen)

    zebra = Building.new("123", "Zebra Apartments")
    zebra.add_apartment(apartment_1)

    adlington = Street.new("Adlington Road")
    adlington.add_building(zebra)

    expect(adlington.list_available_apartments).to eq({
      "Zebra Apartments" => {
        "available_apartment_#1" => ["bathroom", "bedroom", "kitchen"]
      }
    })

    apartment_1.rent

    expect(adlington.list_available_apartments).to eq(nil)

    apartment_2 = Apartment.new
    apartment_2.add_room(bathroom)
    apartment_2.add_room(laundry)

    apartment_3 = Apartment.new
    apartment_3.add_room(bedroom)
    apartment_3.add_room(kitchen)

    zebra.add_apartment(apartment_2)
    zebra.add_apartment(apartment_3)

    apartment_4 = Apartment.new
    apartment_4.add_room(bathroom)
    
    apartment_5 = Apartment.new
    apartment_5.add_room(laundry)
    apartment_5.add_room(bedroom)
    apartment_5.add_room(kitchen)

    savills = Building.new("623", "Savills Apartment Building")
    savills.add_apartment(apartment_4)
    savills.add_apartment(apartment_5)
    adlington.add_building(savills)

    expect(adlington.list_available_apartments).to eq({
      "Zebra Apartments" => {
        "available_apartment_#2" => ["bathroom", "laundry"],
        "available_apartment_#3" => ["bedroom", "kitchen"]
      },
      "Savills Apartment Building" => {
        "available_apartment_#1" => ["bathroom"],
        "available_apartment_#2" => ["laundry", "bedroom", "kitchen"]
      }
    })
  end
end
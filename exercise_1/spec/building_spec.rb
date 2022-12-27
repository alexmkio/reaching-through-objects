require 'rspec'
require_relative '../lib/building'
require_relative '../lib/apartment'

RSpec.describe Building do
  it 'has a number' do
    bldg = Building.new("623", "Savills Apartment Building")

    expect(bldg.building_number).to eq('623')
  end

  it 'has a name' do
    bldg = Building.new("623", "Savills Apartment Building")

    expect(bldg.building_name).to eq('Savills Apartment Building')
  end

  it 'can add apartments' do
    bldg = Building.new("623", "Savills Apartment Building")

    expect(bldg.apartments.length).to eq(0)

    bldg.add_apartment(Apartment.new)
    bldg.add_apartment(Apartment.new)
    bldg.add_apartment(Apartment.new)
    bldg.add_apartment(Apartment.new)
    expect(bldg.apartments.length).to eq(4)
  end

  it 'can have up to 4 apartments' do
    bldg = Building.new("623", "Savills Apartment Building")

    expect(bldg.add_apartment(Apartment.new)).to eq('Apartment added')
    expect(bldg.add_apartment(Apartment.new)).to eq('Apartment added')
    expect(bldg.add_apartment(Apartment.new)).to eq('Apartment added')
    expect(bldg.add_apartment(Apartment.new)).to eq('Apartment added')

    expect(bldg.add_apartment(Apartment.new)).to eq("You've reached the maximum number of apartments this building can have")
    expect(bldg.apartments.length).to eq(4)
  end

  it 'can should be able to list those apartments' do
    bldg = Building.new("623", "Savills Apartment Building")

    apt_1 = Apartment.new
    apt_2 = Apartment.new
    apt_5 = Apartment.new

    bldg.add_apartment(apt_1)
    bldg.add_apartment(apt_2)
    bldg.add_apartment(apt_5)

    expect(bldg.list_apartments).to eq([apt_1, apt_2, apt_5])
  end
end
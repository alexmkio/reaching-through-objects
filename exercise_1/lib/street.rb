class Street
  attr_reader :name,
              :buildings

  def initialize(name)
    @name = name
    @buildings = []
  end

  def add_building(building)
    @buildings << building
  end

  def list_buildings_by_name_alphabetically
    names = @buildings.map do |building|
      building.building_name
    end
    names.sort
  end

  def number_of_available_apartments
    @buildings.sum {|building| 4 - building.apartments.length}
  end

  def list_available_apartments
    # building has building_name and apartments array
    # apartments has is_rented? and rooms array
    # room has name

    # it really should return
    # {
    #   building_name: {
    #     available_apartment_#1 (out of thin air): rooms[],
    #   }
    # }

    returned_value = nil
    buildings.each_with_index do |building, _i|
      building_obj = {}

      building.apartments.each_with_index do |apartment, i|
        if apartment.is_rented? === false
          room_names = apartment.rooms.map do |room|
            room.name
          end
          building_obj["available_apartment_##{i+1}"] = room_names
        end
        # alternative way to write
        # building_obj["available_apartment_##{i + 1}"] = apartment[:rooms] if apartment[:is_rented] === false
      end

      # couldn't figure out how to write ternary and have key "Zebra Apartments" instead of :"Zebra Apartments"
      # building_obj.empty? ? returned_value = "No available apartments" : returned_value = { "#{building.building_name}": building_obj }

      if !building_obj.empty?
        if !returned_value
          returned_value = {}
        end
        returned_value["#{building.building_name}"] = building_obj
      end
    end
    returned_value
  end
end
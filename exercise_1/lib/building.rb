class Building
  attr_reader :building_number,
              :building_name,
              :apartments

  def initialize(number, name)
    @building_number = number
    @building_name = name
    @apartments = []
  end

  def add_apartment(apartment)
    if @apartments.length < 4
      @apartments << apartment
      "Apartment added"
    else
      "You've reached the maximum number of apartments this building can have"
    end
  end

  def list_apartments
    @apartments
  end
end
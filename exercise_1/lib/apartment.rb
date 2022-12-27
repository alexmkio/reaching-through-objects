class Apartment
  attr_reader :rented,
              :rooms

  def initialize
    @rented = false
    @rooms = []
  end

  def is_rented?
    @rented
  end

  def rent
    @rented = true
  end

  def add_room(room)
    if @rooms.length < 4
      @rooms << room
      "Room added"
    else
      "You've reached the maximum number of rooms this apartment can have"
    end
  end

  def list_rooms_by_name_alphabetically
    names = @rooms.map do |room|
      room.name
    end
    names.sort
  end
end
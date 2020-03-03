require_relative "room"

class Hotel
  def initialize(name, room_hash)
    @name = name
    @rooms = {}
    room_hash.each { |room, capacity| @rooms[room] = Room.new(capacity) }
  end

  def name
    @name.split.map(&:capitalize).join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists?(name)
    return true if @rooms.key?(name)

    false
  end

  def check_in(person, room_name)
    if !room_exists?(room_name)
      puts 'sorry, room does not exist'
    elsif @rooms[room_name].add_occupant(person)
      puts 'check in successful'
    else
      puts 'sorry, room is full'
    end
  end

  def has_vacancy?
    @rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
    @rooms.each { |name, room| puts name + ' ' + room.available_space.to_s }
  end
end

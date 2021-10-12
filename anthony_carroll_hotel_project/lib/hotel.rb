require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = {}
        rooms.each do |key, value|
            @rooms[key] = Room.new(value)
        end
    end

    def name
        arr = []
        @name.split(" ").each do |ele|
            arr << ele.capitalize
        end
        arr.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        if @rooms.has_key?(room)
            return true
        end
        false
    end

    def check_in(person, room_name)
        exists = room_exists?(room_name)

        if !exists
            p "sorry, room does not exist"
            #room_exists?(room_name)
        else
            is_in = @rooms[room_name].add_occupant(person)
            if is_in
                p "check in successful"
            else
                p "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        all_full = @rooms.values.all? { |room| room.full? }
        if all_full
            return false
        end
        true
    end

    def list_rooms
        #debugger
        @rooms.each do |key, value|
            #debugger
            puts key + " " + value.available_space.to_s
        end
    end

end

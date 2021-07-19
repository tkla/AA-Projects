require_relative "room"

class Hotel
    
    def initialize(name, hash)
        @name = name 
        @rooms = Hash.new 

        hash.each do |k, v| 
            @rooms[k] = Room.new(v)
        end
    end

    def name 
        tmp = @name 
        tmp.split.each { |w| w[0] = w[0].upcase}.join(" ")
    end

    def rooms 
        @rooms 
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(person, name)
        if room_exists?(name)
           @rooms[name].add_occupant(person)? (puts "checkin successful") : (puts "sorry room is full")
        else 
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.each do |k, v| 
            if !v.full? 
                return true 
            end
        end
        false 
    end

    def list_rooms 
        @rooms.each do |k,v| 
            print "#{k} #{v.available_space}\n"
        end
    end
end

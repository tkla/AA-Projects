class Room

    attr :capacity, :occupants

    def initialize(c)
        @capacity = c 
        @occupants = []
    end

    def full? 
        @occupants.length >= @capacity
    end

    def available_space
        (@capacity > @occupants.length)? @capacity - @occupants.length : 0
    end 

    def add_occupant(name)
        if !full? 
            @occupants << name 
            true 
        else 
            false 
        end
    end
end

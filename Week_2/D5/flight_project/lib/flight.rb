require_relative "passenger"

class Flight
    attr_reader :passengers 

    def initialize(fn, cap)
        @flight_number = fn 
        @capacity = cap 
        @passengers = [] 
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(passenger)
        if !full? 
            @passengers << passenger if passenger.has_flight?(@flight_number)
        end
    end

    def list_passengers
        @passengers.map{ |n| n.name}
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(p)
        board_passenger(p)
    end
end
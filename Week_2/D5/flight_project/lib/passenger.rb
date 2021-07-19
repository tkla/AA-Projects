class Passenger
    attr_reader :name 

    def initialize(name)
        @name = name 
        @flight_numbers = [] 
    end

    def has_flight?(flight_number)
        flight_number.upcase!
        @flight_numbers.any? do |i| 
            i == flight_number
        end
    end

    def add_flight(flight_n)
        if !has_flight?(flight_n)
            @flight_numbers << flight_n 
        end 
    end
end 
class ComputerPlayer
    attr_reader :mark 
    def initialize(mark = :X)
        @mark = mark 
    end

    def get_position(legal)
        pos = legal[rand(0...legal.length)]
        puts "Selecting #{pos} with mark: #{@mark}"
        pos 
    end
end
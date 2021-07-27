class Employee

    attr_reader :name, :title, :boss, :salary
    def initialize(name = "", title = "", boss = "", salary = 0)
        @name = name 
        @title = title
        @boss = boss
        @salary = salary
    end

    def bonus (mult) 
        bonus = salary * mult
        
    end

end
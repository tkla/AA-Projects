require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees 

    def initialize(name, funding, salaries)
        @name = name 
        @funding = funding 
        @salaries = salaries 
        @employees = [] 
    end

    def valid_title?(title) 
        @salaries.has_key?(title)
    end

    def >(startup)
        @funding > startup.funding 
    end

    def hire(name, title) 
        if !valid_title?(title) 
            raise "Invalid title"
        else 
            @employees << Employee.new(name, title)
        end
    end

    def size
        @employees.length 
    end

    def pay_employee(employee)
        payment = @salaries[employee.title]
        if @funding >= payment
            employee.pay(payment) 
            @funding -= payment 
        else
            raise "Hold up, we're broke"
        end
    end

    def payday
        @employees.each { |i| pay_employee(i)}
    end

    def average_salary
        sum = @employees.inject(0) do |acc, i| 
            acc += @salaries[i.title] 
        end
        sum /= @employees.length 
    end

    def close 
        @employees = [] 
        @funding = 0 
    end 

    def acquire(startup) 
        @funding += startup.funding 

        startup.salaries.each do |k, v| 
            @salaries[k] = v if !@salaries.has_key?(k) 
        end

        startup.employees.each { |i| @employees << i }
        startup.close 
    end
end

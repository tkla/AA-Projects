require_relative "employee.rb"

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, boss, salary)
        super 
        @employees = [] 
    end

    def bonus(mult)
        sum = 0 
        @employees.each do |sub_emp| 
            sum += sub_emp.salary 
            if sub_emp.is_a?(Manager)
                sub_emp.employees.each { |sub_subemp| sum += sub_subemp.salary}
            end
        end
        sum * mult 
    end
    
    def add_employee(employee)
        @employees += employee 
    end
end

ned = Manager.new("Ned", "Founder", nil, 1000000)
darren = Manager.new("Darren", "TA Manager", "Ned", 78000)
shawna = Employee.new("Shawna", "TA", "Darren", 12000)
david = Employee.new("David", "TA", "Darren", 10000)

ned.add_employee([darren])
darren.add_employee([shawna, david])

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
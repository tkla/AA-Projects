class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity 
        @teachers = []
        @students = [] 
        @grades = Hash.new{ |hash, k| hash[k] = Array.new}
    end

    def name 
        @name
    end

    def slogan 
        @slogan
    end

    def teachers 
        @teachers
    end

    def students 
        @students 
    end 

    def hire(str)
        @teachers << str 
    end 

    def enroll(str)
        if students.length < @student_capacity 
            students << str 
            true
        else
            false
        end
    end

    def enrolled?(str)
        students.each do |i| 
            if i.downcase.include?(str.downcase) 
                return true
            end
        end
        false 
    end 

    def student_to_teacher_ratio
        students.length/teachers.length
    end

    def add_grade(str, grade)
        students.each do |s| 
            if s.casecmp?(str) 
                @grades[str] << grade 
                return true 
            end
        end
        false 
    end

    def num_grades(student) 
        return @grades[student].length 
    end 

    def average_grade(student)
        if @grades.has_key?(student)
            @grades[student].sum/@grades[student].length 
        else 
            nil
        end
    end
end

require "employee"
require "byebug"

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        if @salaries.has_key?(title)
            return true
        end
        false
    end

    def >(startup)
        if self.funding > startup.funding
            return true
        end
        false
    end

    def hire(name, title)
        if !valid_title?(title)
            raise "invalid title"
        end
        @employees << Employee.new(name, title)
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = salaries[employee.title]
        if salary > funding
            raise "insufficient funds"
        end
        @funding -= salary
        employee.pay(salary)
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        total = 0
        @employees.each do |emp|
            total += @salaries[emp.title]
        end
        total / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |key, value|
            if !@salaries.has_key?(key)
                @salaries[key] = value
            end
        end
        startup.employees.each do |employee|
            @employees << employee
        end
        startup.close
    end



end

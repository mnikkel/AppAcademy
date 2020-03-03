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
    @salaries.key?(title)
  end

  def >(other)
    @funding > other.funding
  end

  def hire(employee_name, title)
    raise 'invalid title' unless valid_title?(title)

    @employees << Employee.new(employee_name, title)
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]
    raise 'not enough funding to pay employee' unless salary <= @funding

    employee.pay(salary)
    @funding -= salary
  end

  def payday
    @employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    total_pay = @employees.reduce(0) do |sum, employee|
      sum + @salaries[employee.title]
    end
    total_pay.to_f / employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(target)
    @funding += target.funding
    target.salaries.each do |title, salary|
      @salaries[title] = salary unless @salaries.key?(title)
    end
    @employees += target.employees
    target.close
  end
end

class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = [] }
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

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity
      @students << student
      return true
    end

    false
  end

  def enrolled?(student)
    @students.map(&:downcase).include?(student.downcase)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if enrolled?(student)
      @grades[student] << grade
      return true
    end

    false
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    return nil unless enrolled?(student) && num_grades(student).positive?

    @grades[student].sum / @grades[student].length
  end
end

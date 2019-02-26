class Student
  attr_reader :first_name

  @@all = []

  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(test_name, status, instructor)
    BoatingTest.new(test_name, status, instructor, self)
  end

  def self.find_student(first_name)
    self.all.find do |student|
      student.first_name == first_name
    end
  end

  def boating_tests
    BoatingTest.all.select do |boating_test|
      boating_test.student == self
    end
  end

  def grade_percentage
    passed_tests = boating_tests.select do |boating_test|
      boating_test.status == 'passed'
    end.length
    passed_tests.to_f / boating_tests.length * 100
  end

end

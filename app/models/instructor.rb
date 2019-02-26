class Instructor
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def pass_student(test_name, student)
    correct_test = BoatingTest.all.find do |boating_test|
      boating_test.student == student && boating_test.name == name
    end
      if correct_test
        correct_test.status = 'passed'
      else
        BoatingTest.new(test_name, status, self, student)
      end
  end

  def fail_student
  end

end

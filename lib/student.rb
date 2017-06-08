require "byebug"
class Student

  attr_reader :first_name, :last_name

  def initialize(first_name,last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def courses
    @courses
  end

  def name
    @name = @first_name + " " + @last_name
  end

  def enroll(course_object)
    #returns if that object already exist
    return if @courses.include?(course_object)
    @courses << course_object #add the course object
    @courses.last.students << self #update the course's list of student
  end

  def course_load
    course_hash = {}
    @courses.each do |course|
      if course_hash.has_key?(course.department)
        course_hash[course.department] += course.credits
      else
        course_hash[course.department] = course.credits
      end
    end
    course_hash
  end

end

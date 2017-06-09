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
    @name = "#{@first_name} #{@last_name}" # This format is preferred
  end

  def enroll(course_object)
    error_check(course_object) # Doesn't adding the same course twice always raise this error?
    #returns if that object already exist
    return if @courses.include?(course_object)      # If so, this check should be redundant...
    @courses << course_object #add the course object
    @courses.last.students << self #update the course's list of student # Clever.
  end

  def error_check(course_object)
    if @courses.any? {|course| course.conflicts_with?(course_object)}
      raise "There is a time conflict, please check schedule."
    end
  end

  def course_load
    course_hash = Hash.new(0)
    @courses.each do |course|
      course_hash[course.department] += course.credits
    end
    course_hash
  end

end

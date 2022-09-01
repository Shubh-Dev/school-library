require_relative './person'
require_relative './class_room'

class Student < Person
  attr_reader :classroom

  def initialize( age, classroom, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
    @parent_permission = parent_permission
    @student = []
  end

  def play_hookey
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end

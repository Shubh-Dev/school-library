claass ClassRoom

attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end
  
  def add_student(student)
    students.push(student)
    student.class_room = self
  end
end
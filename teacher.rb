require_relative './person'

class Teacher < Person
  def initialize(age, specialization, parent_permission: true, name = 'unknown')
    @specialization = specialization
    super(name, age, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end

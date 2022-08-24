require_relative 'Person'

class Student < Person
    def initialize(classroom)
        super(age, name, parent_permission: parent_permission)
        @classroom = classroom
    end
    def play_hookey
        "¯\(ツ)/¯"
    end
end 


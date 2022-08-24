class Person
    def initialize(name="Unknown", age, parent_permission=true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
    end

    def get_id
        @id
    end
    def get_name
        @name
    end
    def get_age
        @age
    end

    def set_name(name)
        @name = name
    end

    def set_age(age)
        @age = age
    end

    def is_of_age?
        @age >= 18
    end

    def can_use_services?
        @age >= 18 || @parent_permission
    end
end
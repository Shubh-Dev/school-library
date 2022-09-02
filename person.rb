require_relative './nameable'
require_relative './trimmer_decorator'
require_relative './capitalize_decorator'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader  :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end

  public :can_use_services?

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
    rental.person = self
  end
end

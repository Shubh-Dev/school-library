require_relative './book'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end
end

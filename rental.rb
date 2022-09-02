# require_relative './book'
# require_relative './person'

class Rental
  attr_accessor :date, :person
  attr_reader :book

  def initialize(date, person, book)
    @date = date

    @person = person
    @person.rentals << self unless @person.rentals.include?(self)

    @book = book
    @book.rentals << self unless @book.rentals.include?(self)
  end

  # def person=(person)
  #   @person = person
  #   @person.rentals << self unless @person.rentals.include?(self)
  # end

  # def book=(book)
  #   @book = book
  #   @book.rentals << self unless @person.rentals.include?(self)
  # end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end
end

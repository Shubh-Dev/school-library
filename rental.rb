require_relative './book'

class Rental
  attr_accessor :date, :person, :book :rentals

  def initialize(date, person, book)
    @rentals = []
    @date = date

    @person = person
    person.rentals << self unless @person.rentals.include?(self)

    @book = book
    book.rentals << self unless @book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    @person.rentals << self unless @person.rentals.include?(self)
  end

    def book=(book)
        @book = book
        @book.rentals << self unless @book.rentals.include?(self)
    end

    def add_rental(book, date)
        Rental.new(date, self, book)
    end 
end

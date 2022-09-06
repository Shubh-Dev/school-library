require_relative './app'

class Display
  def initialize
    @newapp = App.new
  end

  def main_list
    puts 'Welcome to school Library'
    puts ' '
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def options(option)
    case option
    when 1
      @newapp.list_all_books
    when 2
      @newapp.list_all_people
    when 3
      @newapp.create_person
    when 4
      @newapp.create_book
    when 5
      @newapp.create_rental
    else
      @newapp.list_rentals_id
    end
  end
end

# require_relative './app'

# def main
#   app = App.new
#   app.menu_option
# end
# main

require_relative './app'

def main 
  books = []
  people = []
  rentals = []

  options(books, people, rentals)
end

def main_list 
  puts "Welcome to school Library"
  puts "What do you want to do?"
  puts "1 - List all books"
  puts "2 - List all people"
  puts "3 - Create a person"
  puts "4 - Create a book"
  puts "5 - Create a rental"
  puts "6 - List all rentals for a given person id"
  puts "7 - Exit"
end

def options(books, people, rentals)
  loop do
    main_list
    option = gets.chomp.to_i
    case option
    when 1
      list_all_books(books)
    when 2
      list_all_people(people)
    when 3
      create_person(people)
    when 4
      create_book(books)
    when 5
      create_rental(books, people, rentals)
    when 6
      list_all_rentals_by_id(rentals)
    else
      break
    end
  end
end
main
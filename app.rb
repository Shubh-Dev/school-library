require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
# require_relative './main'

def list_all_books(books)
  if books.empty?
    puts 'There are no books in the library'
  else
    books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
  end
end

def list_all_people(people)
  if people.empty?
    puts 'There are no people in the library'
  else
    people.each { |person| puts "[#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}" }
  end
end

def create_person(person)
  puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
  selected_person = gets.chomp.to_i
  print 'name: '
  name = gets.chomp.to_s
  print 'age: '
  age = gets.chomp.to_i
  case selected_person
  when 1
    print 'Has parent permission? [Y/N]: '
    provided_permission = gets.chomp.capitalize
    student_permission = true if provided_permission == 'Y'
    student_permission = false if provided_permission == 'N'
    person.push(Student.new(nil, age, name, parent_permission: student_permission))

  when 2
    print 'Specialization: '
    specialization = gets.chomp.to_s
    person.push(Teacher.new(name, specialization, age))
  end
  puts 'Person created successfully'
end

def create_book(books)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  books.push(Book.new(title, author))
  puts 'Book created successfully'
end

def create_rental(books, people, _rentals)
  puts 'Select a book from the following list by number'
  books.map.with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
  selected_book = gets.chomp.to_i

  puts 'Select a person from the following list by number (not id)'
  people.map.with_index do |person, index|
    puts "#{index}) [#{person.class}]
  Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  selected_person = gets.chomp.to_i
  print 'Date: '
  date = gets.chomp
  rentals.push(Rental.new(date, books[selected_book], people[selected_person]))
  puts 'Rental created successfully'
end

def list_all_rentals_by_id(rentals)
  print 'ID of person:'
  person_id = gets.chomp.to_i
  puts 'Rentals:'
  rentals.map do |rental|
    puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
  end
end

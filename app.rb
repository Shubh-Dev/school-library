require_relative './book'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'

class App
  def initialize
    @books = []
    @rentals = []
    @person = []
  end

  def menu
    puts 'Welcome to the Library'
    puts 'Please choose an option by enterung a number:'
    puts '1 - List all books'
    puts '2 - List all People'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Createe a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    gets.chomp
  end

  def menu_option
    choice = menu.to_s
    case choice
    when '1'
      list_books
    when '2'
      list_persons
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals_for_a_given_person_id
    else
      puts 'Thank you for using this app'
      exit
    end
  end

  def create_book
    print 'Title: '
    input1 = gets.chomp
    print 'Author: '
    input2 = gets.chomp
    book = Book.new(input1, input2)
    @books.push(book)
    puts 'Book created successfully '
    menu_option
 end

  def create_person
    print "\n Do you want to create a student (1) or a teacher (2)? [Input the number]:"
    user_input = gets.chomp
    case user_input
    when '1'
      create_student
    when '2'
      create_teacher
    else
      print 'Please input either 1 or 2'
      create_person
    end
    puts 'Person created successfully'
    gets
    menu_option
  end

  def create_rental
    print 'Select a book'
    list_all_books
    input1 = gets.chomp.to_i
    print 'Select a person'
    list_all_people
    input2 = gets.chomp.to_i
    print "\n Date(yyyy/mm/dd): "
    date = gets.chomp.to_i
    rental = Rental.new(date, @person[input2], @books[input1])
    @rental.push(rental)
    puts 'Rental created successfully'
    menu_option
  end

  def list_all_books
    @books.each_with_index do |item, index|
      puts "#{index} Title: \"#{item.title}\", Author: #{item.author}"
    end
  end

  def list_books
    list_all_books
    puts 'Press enter to continue.'
    gets.chomp
    menu_option
  end

  def list_all_people
    @person.each_with_index do |item, index|
      puts "#{index} Name: #{item.name} Age: #{item.age} ID: #{item.id}"
    end
  end

  def list_persons
    list_all_people
    puts 'Preaa Enter to continue'
    gets.chomp
    menu_option
  end

  def create_student
    puts 'Enter name'
    name = gets.chomp
    puts 'Enter age: '
    age = gets.chomp
    puts "'Has parent permission? [Y/N]:'"
    permission = gets.chomp
    if permission == 'N'
      student = Student.new(name, age, parent_permission: false)
      @person.push(student)
    else
      student = Student.new(name, age, parent_permission: true)
    end
    @person.push(student)
  end

  def create_teacher
    puts 'enter name'
    name = gets.chomp
    puts 'enter age'
    age = gets.chomp
    puts 'enter specialization'
    specialization = gets.chomp
    puts "'Has parent permission? [Y/N]: '"
    permission = gets.chomp

    if permission == 'N'
      teacher = Teacher.new(name, age, specialization, parent_permission: false)
      @person.push(teacher)
    else
      teacher = Teacher.new(name, age, specialization, parent_permission: true)
    end
    @person.push(teacher)
  end

  def list_all_rentals_for_a_given_person_id
    puts 'Please enter a person id: '
    userid = gets.chomp.to_i
    rent = @rentals.select do |rents|
      rents.Person.id == userid
    end
    if rent.empty?
      puts 'No rentsl found for this person ID'
    else
      rent.each do |item|
        puts "Date: #{item.date} Book: \"#{item.book.title}\" by #{item.book.author}"
      end
    end
    menu_option
  end
end

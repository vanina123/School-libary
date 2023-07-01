require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
class App
  def initialize
    @people = []
    @books = []
  end

  def list_all_books
    @books.each do |book|
      puts "#{book.title} by #{book.author} on #{book.rental.count} rentals"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, , Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? '
    person_type = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    print 'Age:'
    age = gets.chomp.to_i
    if person_type == 1
      print 'Whats the parent permission? (y/n) '
      parent_permission = gets.chomp == 'y'
      @people << Student.new(name, age, parent_permission)
      puts 'Student created!'
    elsif person_type == 2
      print 'Specialization:'
      specialization = gets.chomp
      @people << Teacher.new(name, age, specialization)
      puts 'Teacher created!'
    else
      puts 'Person not created!'
    end
  end

  def create_a_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
  end

  def create_a_rental
    puts 'Choose a book from the list by number: (not Id)'
    @books.each_with_index do |book, index|
      puts "#{index}) #{book.title} by #{book.author}"
    end
    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts 'Choose a person from the list by number: (not Id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.age}, Age: #{person.age} "
    end
    person_index = gets.chomp.to_i
    person = @people[person_index]
    puts 'Date in format yyyy/mm/dd:'
    date = gets.chomp
    Rental.new(date, book, person)
    puts 'Rental created!'
  end

  def list_all_rentals_for_a_given_person_id
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}"
    end
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals: '

    person = @people.each do |p|
      break p if p.id == person_id
    end

    person.rental.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def quit
    puts 'existing the app. Goodbye'
    exit
  end
end

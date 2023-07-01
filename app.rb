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
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}"
    end
  end

  def create_a_teacher
    puts 'enter your name'
    name = gets.chomp
    puts 'enter your age'
    age = gets.chomp.to_i
    puts 'enter your specialization'
    specialization = gets.chomp
    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    puts 'Teacher created successfully.'
  end

  def create_a_student
    puts 'enter your name'
    name = gets.chomp
    puts 'enter your age'
    age = gets.chomp.to_i
    puts 'what is the parent_permission? (Y/N)'
    parent_permission = gets.chomp

    student = Student.new(name, age, parent_permission)
    @people << student
    puts 'Student created successfully.'
  end

  def create_a_book
    puts 'enter the title of the book'
    title = gets.chomp
    puts 'enter the author'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
  end

  def create_a_rental
    puts 'Choose a book from the list by number'
    @books.each_with_index do |book, index|
      puts "#{index} - #{book.title} by #{book.author}"
    end
    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts 'Choose a person from the list by number:'
    @people.each_with_index do |person, index|
      puts "#{index} - #{person.name} - #{person.age} - #{person.class}"
    end
    person_index = gets.chomp.to_i
    person = @people[person_index]
    puts 'Date: '
    date = gets.chomp
    Rental.new(date, book, person)
    puts 'Rental created!'
  end

  def list_rentals_for_a_person
    puts 'Choose a person from the list by number'
    @people.each_with_index do |person, index|
      puts "#{index} - #{person.name}"
    end
    person_index = gets.chomp.to_i
    person = @people[person_index]
    person.rental.each do |rental|
      puts "Book: #{rental.book.title} - Date: #{rental.date}"
    end
  end

  def quit
    puts 'existing the app. Goodbye'
    exit
  end
end

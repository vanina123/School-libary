require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'lib/save_data.rb'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
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
    puts 'Do you want to create a student (1) or a teacher (2)? '
    person_type = gets.chomp.to_i

    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Person not created!'
    end
  end

  def create_student
    name = get_user_input('Name: ')
    age = get_user_input('Age: ').to_i
    parent_permission = get_user_input('What\'s the parent permission? (y/n) ').downcase == 'y'

    @people << Student.new(name, age, parent_permission)
    puts 'Student created!'
  end

  def create_teacher
    name = get_user_input('Name: ')
    age = get_user_input('Age: ').to_i
    specialization = get_user_input('Specialization: ')

    @people << Teacher.new(name, age, specialization)
    puts 'Teacher created!'
  end

  def get_user_input(prompt)
    print prompt
    gets.chomp
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
    @rentals << Rental.new(date, book, person)
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
    save_books(@books)
    save_people(@people)
    save_rentals(@rentals)
    exit
  end

  def save_books(arr) 
    new_arr = []
    arr.each do |book|
      obj = {
        title: book.title,
        author: book.author
      }
      new_arr << obj
    end
    save(new_arr, 'books')
  end

  def save_people(arr)
    new_arr = []
    arr.each do |person|
      if person.class.name == 'Student'
        obj = {
          class: person.class,
          id: person.id,
          name: person.name,
          age: person.age,
          parent_permission: person.parent_permission,
          rentals: person.rental
        }
        new_arr << obj
      else 
        obj = {
          class: person.class,
          id: person.id,
          name: person.name,
          age: person.age,
          specialization: person.specialization,
          rentals: person.rental
        }
        new_arr << obj
      end
    end
    save(new_arr, 'people')
  end

  def save_rentals(arr)
    new_arr = []
    arr.each do |rental|
      obj = {
        date: rental.date,
        book: {
          title: rental.book.title,
          author: rental.book.author,
          rentals: rental.book.rental
        },
        person: {
          class: rental.person.class,
          id: rental.person.id,
          name: rental.person.name,
          age: rental.person.age,
          parent_permission: rental.person.parent_permission,
          rentals: rental.person.rental
        }
      }
      new_arr << obj
    end
    save(new_arr, 'rentals')
  end
end

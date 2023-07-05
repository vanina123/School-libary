require 'json'
require_relative '../book.rb'
require_relative '../student.rb'
require_relative '../teacher.rb'
require_relative '../rental.rb'

def load_books
    return [] if File.exist?("files/books.json") == false
    new_arr = []
    file = File.read("files/books.json")
    file_data = JSON.parse(file)
    file_data.each do | book |
        new_arr << Book.new(book['title'], book['author'], book['rentals'])
    end
    new_arr
end

def load_people
    return [] if File.exist?("files/people.json") == false
    new_arr = []
    file = File.read("files/people.json")
    file_data = JSON.parse(file)
    file_data.each do | person |
        puts person['id']
        if person['class'] == "Student"
            new_arr << Student.new(person['name'], person['age'], nil, person['id'], parent_permission: person['parent_permission'])
        else
            new_arr << Teacher.new(person['name'], person['age'], person['specialization'], person['id'])
        end
    end 
    new_arr
end

def load_rentals
    return [] if File.exists?("files/rentals.json") == false
    new_arr = []
    file = File.read("files/rentals.json")
    file_data = JSON.parse(file)
    file_data.each do | rental |
        date = rental['date']
        book = Book.new(rental['book']['title'], rental['book']['author'])

        person = if rental['person']['class'] == 'Student'
                    p = rental['person']
                    Student.new(p['name'], p['age'], nil, p['id'], parent_permission: p['parent_permission'])
                else
                    p = rental['person']
                    Teacher.new(p['name'], p['age'], p['specialization'], p['id'])
                end

        new_arr << Rental.new(date, book, person)
    end
    new_arr
end

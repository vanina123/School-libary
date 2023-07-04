require 'json'
require_relative '../book.rb'
require_relative '../student.rb'
require_relative '../teacher.rb'

def load_books
    return [] if File.exist?("files/books.json") == false
    newArray = []
    file = File.read("files/books.json")
    file_data = JSON.parse(file)
    file_data.each do | book |
        newArray << Book.new(book.title, book.author)
    end
    return newArray
end

def load_people
    return [] if File.exist?("files/people.json") == false
    newArray = []
    file = File.read("files/people.json")
    file_data = JSON.parse(file)
    file_data.each do | person |
        if person.class == "Student" 
            newArray << Student.new(person.name, person.age,nil, person.parent_permission)
        else 
            newArray << Teacher.new(person.name, person.age, person.specialization)
        end
    end 
end

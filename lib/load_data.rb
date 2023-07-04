require 'json'
require_relative '../book.rb'


def load_books
    return [] if File.exists?("files/books.json") == false
    newArray = []
    file = File.read("files/books.json")
    file_data = JSON.parse(file)
    file_data.each do | book |
        newArray << Book.new(book.title, book.author)
    end
    return newArray
end

def 

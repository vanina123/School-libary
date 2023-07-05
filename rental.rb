# class Rental
#   attr_accessor :date
#   attr_reader :book, :person

#   def initialize(date, book, person)
#     @date = date

#     @book = book
#     book.rental ||= []
#     book.rental << self

#     @person = person
#     person.rental ||= []
#     person.rental << self
#   end
# end

class Rental
  attr_accessor :date, :book, :person

  def person=(person)
    person.rental.push(self) unless person.rental.include?(self)
  end

  def book=(book)
    book.rental.push(self) unless book.rental.include?(self)
  end

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    self.person = person
    self.book = book
  end
end

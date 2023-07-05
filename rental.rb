class Rental
  attr_accessor :date
  attr_reader :person, :book

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

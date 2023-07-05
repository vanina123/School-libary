class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author, rentals = [])
    @title = title
    @author = author
    @rental = rentals.class == 'NilClass' ? [] : rentals
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end

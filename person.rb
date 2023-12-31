require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rental, :parent_permission

  def initialize(name, age, id, parent_permission)
    @id = id || Random.rand(1..1000)
    @name = name
    @age = age || 0
    @parent_permission = parent_permission
    @rental = []
    super()
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end

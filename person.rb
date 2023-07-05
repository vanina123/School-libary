class Person
  attr_reader :id
  attr_accessor :name, :age, :rental, :parent_permission

  def initialize(name, age, id = Random.rand(1..1000), parent_permission)
    @id = id
    @name = name
    @age = age || 0
    @parent_permission = parent_permission
    @rental = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end

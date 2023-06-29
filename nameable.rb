class Nameable < Object
  def correct_name
    raise NotImplementedError
  end
end

class Person < Nameable
  attr_reader :name

  def initialize(name)
    super()
    @name = name
  end

  def correct_name
    @name
  end
end

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    if @nameable.correct_name.length > 10
      @nameable.correct_name[0..9]
    else
      @nameable.correct_name
    end
  end
end

person = Person.new('John Doe')

decorated_person = CapitalizeDecorator.new(TrimmerDecorator.new(person))

puts decorated_person.correct_name # => "John"

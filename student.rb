require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(name, age, classroom, id = nil, parent_permission: true)
    super(name, age, id, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end
end

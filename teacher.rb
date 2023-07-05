require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(name, age, specialization, id)
    super(name, age, id, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end

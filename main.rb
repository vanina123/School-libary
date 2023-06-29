require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'nameable'

person = Person.new(1, 20)
puts person.can_use_services? # true

student = Student.new(2, 16, classroom) # Pass the classroom instance
puts student.can_use_services? # true
puts student.play_hooky # ¯\(ツ)/¯

teacher = Teacher.new(3, 35, 'Math')
puts teacher.can_use_services? # true

person = Nameable.new('John Doe')

decorated_person = CapitalizeDecorator.new(TrimmerDecorator.new(person))

puts decorated_person.correct_name # => "John"

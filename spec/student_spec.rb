require_relative '../student'
require_relative '../person'

describe Student do
  let(:name) { 'John Doe' }
  let(:age) { 10 }
  let(:classroom) { '1A' }
  let(:id) { 12_345 }

  subject(:student) { Student.new(name, age, classroom, id) }

  describe '#initialize' do
    it 'sets the name, age, classroom, and id' do
      expect(student.name).to eq(name)
      expect(student.age).to eq(age)
      expect(student.classroom).to eq(classroom)
      expect(student.id).to eq(id)
    end
  end

  describe '#play_hooky' do
    it 'prints a specific message' do
      expect { student.play_hooky }.to output("¯\\(ツ)/¯\n").to_stdout
    end
  end
end

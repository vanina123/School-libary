require_relative '../classroom.rb'
require_relative '../student.rb'

describe Classroom do
  let(:label) { "1A" }
  let(:student1) { Student.new("John Doe", 10, "1A", 12345) }
  let(:student2) { Student.new("Jane Doe", 11, "1A", 45678) }

  subject(:classroom) { Classroom.new(label) }

  describe "#initialize" do
    it "sets the label" do
      expect(classroom.label).to eq(label)
    end

    it "sets the student array to empty" do
      expect(classroom.student).to eq([])
    end
  end

  describe "#add_student" do
    it "adds the student to the student array" do
      classroom.add_student(student1)
      expect(classroom.student).to include(student1)
    end

    it "sets the classroom of the student" do
      classroom.add_student(student2)
      expect(student2.classroom).to eq(classroom)
    end
  end
end

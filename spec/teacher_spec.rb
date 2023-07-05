require_relative '../teacher.rb'
require_relative '../person.rb'

describe Teacher do
  let(:name) { "John Doe" }
  let(:age) { 30 }
  let(:specialization) { "Mathematics" }
  let(:id) { 12345 }

  subject(:teacher) { Teacher.new(name, age, specialization, id) }

  describe "#initialize" do
    it "sets the name, age, specialization, and id" do
      expect(teacher.name).to eq(name)
      expect(teacher.age).to eq(age)
      expect(teacher.specialization).to eq(specialization)
      expect(teacher.id).to eq(id)
    end
  end

  describe "#can_use_services" do
    it "returns true" do
      expect(teacher.can_use_services).to be true
    end
  end
end
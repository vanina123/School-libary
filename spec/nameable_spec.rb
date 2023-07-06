require_relative '../nameable'
require_relative '../person'

describe Nameable do
  subject(:nameable) { Nameable.new }

  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

describe Person do
  let(:name) { 'John Doe' }
  let(:age) { 23 }
  let(:id) { 543 }

  subject(:person) { Person.new(name, age, id, true) }

  describe '#initialize' do
    it 'sets the name attribute' do
      expect(person.name).to eq(name)
    end
  end

  describe '#correct_name' do
    it 'returns the name' do
      expect(person.correct_name).to eq(name)
    end
  end
end

describe Decorator do
  let(:nameable) { instance_double(Nameable) }

  subject(:decorator) { Decorator.new(nameable) }

  describe '#initialize' do
    it 'sets the nameable attribute' do
      expect(decorator.nameable).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'delegates to the nameable object' do
      allow(nameable).to receive(:correct_name).and_return('John Doe')
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end

describe CapitalizeDecorator do
  let(:nameable) { instance_double(Nameable) }

  subject(:capitalize_decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it "capitalizes the nameable object's correct_name" do
      allow(nameable).to receive(:correct_name).and_return('john doe')
      expect(capitalize_decorator.correct_name).to eq('John doe')
    end
  end
end

describe TrimmerDecorator do
  let(:nameable) { instance_double(Nameable) }

  subject(:trimmer_decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    context "when the nameable object's correct_name is longer than 10 characters" do
      it "trims the nameable object's correct_name to the first 10 characters" do
        allow(nameable).to receive(:correct_name).and_return('John Doe Smith')
        expect(trimmer_decorator.correct_name).to eq('John Doe S')
      end
    end

    context "when the nameable object's correct_name is not longer than 10 characters" do
      it "returns the nameable object's correct_name as is" do
        allow(nameable).to receive(:correct_name).and_return('John Doe')
        expect(trimmer_decorator.correct_name).to eq('John Doe')
      end
    end
  end
end

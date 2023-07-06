require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  let(:date) { '2023/12/12' }
  let(:book) { Book.new("The Hitchhiker's Guide to the Galaxy", 'Douglas Adams') }
  let(:person) { Person.new('John Doe', 10, '1A', 12_345) }

  subject(:rental) { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'sets the date' do
      expect(rental.date).to eq('2023/12/12')
    end

    it 'sets the book' do
      expect(rental.book).to eq(book)
    end

    it 'sets the person' do
      expect(rental.person).to eq(person)
    end
  end

  describe '#person=' do
    it "adds the rental to the person's rental array" do
      rental.person = person
      expect(person.rental).to include(rental)
    end
  end

  describe '#book=' do
    it "adds the rental to the book's rental array" do
      rental.book = book
      expect(book.rental).to include(rental)
    end
  end
end

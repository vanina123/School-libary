require_relative '../book.rb'
require_relative '../rental.rb'
require_relative '../person.rb'
require 'rspec'

describe Book do
  before :each do
    @book = Book.new("The Hitchhiker's Guide to the Galaxy", "Douglas Adams")
  end

  it "should have a title" do
    expect(@book.title).to eq("The Hitchhiker's Guide to the Galaxy")
  end

  it "should have an author" do
    expect(@book.author).to eq("Douglas Adams")
  end

  it "should be able to add a rental" do
    person = instance_double(Person, name: "John Doe")  # Create a test double for Person
    rental = instance_double(Rental)  # Create a test double for Rental
    allow(Rental).to receive(:new).and_return(rental)  # Mock the Rental.new method
    allow(rental).to receive(:date=)
    allow(rental).to receive(:book=)
    allow(rental).to receive(:person=)

    expect(@book.add_rental("2023/12/12", person)).to eq(rental)
    expect(@book.rental).to be_truthy
  end
end

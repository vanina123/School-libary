require_relative '../book.rb'
require "rspec"


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
    rental = @book.add_rental(Date.today, "John Doe")
    expect(@book.rental).to include(rental)
  end
end

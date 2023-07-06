require_relative '../person'
require_relative '../rental'

describe Person do
  before :each do
    @person = Person.new('John', 23, 543, true)
  end

  it 'Should create a person of same instance' do
    expect(@person).to be_instance_of(Person)
  end

  it 'Should give the correct details' do
    expect(@person.name).to eq('John')
    expect(@person.age).to eq(23)
    expect(@person.id).to eq(543)
    expect(@person.parent_permission).to eq(true)
  end

  it 'Should return trur for can use services' do
    expect(@person.can_use_services?).to eq(true)
  end

  it 'should be able to add a rental' do
    person = instance_double(Person, name: 'John Doe') # Create a test double for Person
    rental = instance_double(Rental) # Create a test double for Rental
    allow(Rental).to receive(:new).and_return(rental) # Mock the Rental.new method
    allow(rental).to receive(:date=)
    allow(rental).to receive(:book=)
    allow(rental).to receive(:person=)

    expect(@person.add_rental('2023/12/12', person)).to eq(rental)
    expect(@person.rental).to be_truthy
  end
end

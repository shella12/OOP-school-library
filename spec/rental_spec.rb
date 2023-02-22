require './rental'
require './book'
require './person'
describe Rental do
   
  it 'should return list of rents by person' do
    rental = Rental.new("2020/12/04", Book.new("title","author"), Person.new(23,"James"))
    expect(rental.person.name).to eql ("James")
  end
#   it 'should return James when we call the correct_name method' do
#     expect(person.correct_name).to eql('James')
#   end
end
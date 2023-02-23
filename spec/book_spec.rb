require './book'
require './rental'
describe Book do
  it "should return instance of 'Rental' when we call the add_rents method" do
    book = Book.new('title', 'author')
    book_rental = book.add_rents(Person.new(32), '2020/12/04')
    expect(book_rental).to be_kind_of(Rental)
  end
end

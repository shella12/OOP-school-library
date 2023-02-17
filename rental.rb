class Rental
  attr_accessor :person, :book, :date

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
    person.rents << self
    book.rents << self
  end
end

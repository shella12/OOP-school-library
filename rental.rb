class Rental
    attr_reader :student, :book, :person
    attr_accessor :date

def initialize(date, student, book, person)
    @date = date

    @student = student
    student.rents << self

    @book = book
    book.rents << self

    @person =person
end

def book=(book)
    @book = book
    book.rents.push(self) unless book.rents.include?(self)
end
def person=(person)
    @person = person
    person.rents.push(self) unless person.rents.include?(self)
  end
end
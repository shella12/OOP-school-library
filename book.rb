class Book
  attr_accessor :title, :author, :rents

  def initialize(title, author)
    @title = title
    @author = author
    @rents = []
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def add_rents(person, date)
    Rental.new(date, self, person)
  end
end

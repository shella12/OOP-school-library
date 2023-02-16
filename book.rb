class Book
  attr_reader :rents
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rents = []
  end

  def add_rents(rent)
    @rent.push(rent)
    rent.book = self
  end
end

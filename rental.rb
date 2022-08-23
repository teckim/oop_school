class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book = nil, person = nil)
    @date = date
    
    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end

  def book=(book)
    @book = book
    book.add_rental(self) unless book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    person.add_rental(self) unless person.rentals.include?(self)
  end
end

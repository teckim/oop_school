require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_reader :books, :persons

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def add_person(type, age, name, parent_permission, specialization = nil)
    case type
    when 'student'
      @persons.push(Student.new(age, name, parent_permission))
    when 'teacher'
      @persons.push(Teacher.new(age, name, parent_permission, specialization))
    end
  end

  def print_persons(numbered: false)
    @persons.each.with_index(1) do |person, index|
      type = person.is_a?(Student) ? 'Student' : 'Teacher'
      text = "[#{type}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"

      if numbered
        puts "#{index}) " + text
      else
        puts text
      end
    end
  end

  def add_book(title, author)
    @books << Book.new(title, author)
  end

  def print_books(numbered: false)
    @books.each.with_index(1) do |book, index|
      text = "Title: #{book.title}, Author: #{book.author}"

      if numbered
        puts "#{index}) " + text
      else
        puts text
      end
    end
  end

  def add_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals << rental
  end

  def print_rentals(rentals)
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity

require 'date'
require_relative 'cli'
require_relative 'app'

CLI = Cli.new
APP = App.new

def main
  input = nil
  while input != 7
    input = CLI.main_menu
    case input
    when 1
      APP.print_books
    when 2
      APP.print_persons
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      print_rentals_by_person_id
    else
      puts 'Goodbye!'
    end
    puts
  end
end

def create_person
  input = CLI.create_person_menu

  return unless input

  age = CLI.read_input('Age').to_i
  name = CLI.read_input('Name')

  case input
  when 1 # Teacher
    puts input
    specialization = CLI.read_input('Specialization')
    APP.add_person('teacher', age, name, nil, specialization)

    puts 'Teacher created successfully'
  when 2 # Student
    parent_permission = %w[y Y].include?(CLI.read_input('Has parent permission? [Y/N]'))
    APP.add_person('student', age, name, parent_permission)

    puts 'Student created successfully'
  end
end

def create_book
  title = CLI.read_input('Title')
  author = CLI.read_input('Author')
  APP.add_book(title, author)

  puts 'Book created successfully'
end

def create_rental
  if APP.books.empty?
    puts 'No books yet!'
    return
  elsif APP.persons.empty?
    puts 'No persons yet!'
    return
  end

  puts 'Select a book from the following list by number'
  APP.print_books(numbered: true)
  book_num = CLI.read_input('Book number').to_i
  return puts 'Invalid book number!' unless book_num.between?(1, APP.books.size)

  book = APP.books[book_num - 1]

  puts 'Select a person from the following list by number (not ID)'
  APP.print_persons(numbered: true)
  person_num = CLI.read_input('Person number').to_i
  return puts 'Invalid person number!' unless person_num.between?(1, APP.persons.size)

  person = APP.persons[person_num - 1]

  puts 'Please enter a date'
  date = CLI.read_input('Date "YYYY-MM-DD"')
  APP.add_rental(date, book, person)

  puts 'Rental created successfully'
end

def print_rentals_by_person_id
  person_id = CLI.read_input('Person ID').to_i
  found_person = APP.persons.find { |person_obj| person_obj.id == person_id }

  if !found_person || found_person.rentals.size.zero?
    puts "No person found with ID #{person_id}, or the person has no rentals"
    return
  end

  APP.print_rentals found_person.rentals
end

main

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity

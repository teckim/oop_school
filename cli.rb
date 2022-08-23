class Cli
  def initialize
    puts 'Welcome to OOP School library app!'
    puts
  end

  def main_menu
    puts 'Please choose and option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    read_menu_input
  end

  def create_person_menu
    puts 'Do you want to create:'
    puts '1 - A teacher'
    puts '2 - A student'
    puts 'Press any other key to return to main menu'

    read_menu_input((1..3))
  end

  def read_menu_input(range = (1..7))
    input = gets.chomp.to_i
    input = nil unless range.include?(input)

    input
  end

  def read_input(label)
    print "#{label}: "
    gets.chomp
  end
end

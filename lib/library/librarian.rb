require 'yaml'

class Librarian

  def initialize(library)
    @library = library
  end

  def instruction
    "Please enter number of operation.\n"+
        "1 - Load the saved library from disk\n" +
        "2 - Show the bestseller\n" +
        "3 - Show the booklover\n" +
        "4 - Show the number of fans popular content\n" +
        "5 - Save your library on disk\n" +
        "0 - exit\n"
  end

  def load
    begin
      file = File.new('./data/library.yml', "r")
      @library = YAML.load(file.read)
    rescue IOError => e
      puts "Exception: #{e}"
      e
    ensure
      file.close unless file.nil?
      puts 'The library was successfully load.'
    end
  end

  def save
    begin
      file = File.open('./data/library.yml', 'w')
      file.write(@library)
    rescue IOError => e
      puts "Exception: #{e}"
      e
    ensure
      file.close unless file.nil?
      puts 'The library was successfully saved.'
    end
  end


  def start
    puts "Hello.\nWe are pleased to welcome you to our library"

    loop do
      puts instruction
      operation = gets.chomp

      case operation
        when '1'
          load
        when '2'
          puts @library.bestseller
        when '3'
          puts @library.booklover
        when '4'
          puts @library.top_orders_amount
        when '5'
          save
        when '0'
          puts 'Bye-bye :)'
          break
        else
          puts 'Wrong you are, please try again ;)'
      end
      puts "\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n\n"
    end
  end

end
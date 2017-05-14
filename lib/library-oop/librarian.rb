require 'yaml'
require './lib/library-oop/models/library'
require './lib/library-oop/populator'
require './lib/library-oop/archivist'

class Librarian

  def initialize(library)
    @library = library
  end

  def instruction
    <<~INSTRUCTION
      Please enter number of operation.
      1 - Load the saved library from disk
      2 - Show the bestseller
      3 - Show the booklover
      4 - Show the number of fans popular content
      5 - Save your library on disk
      6 - Populate data
      0 - exit
    INSTRUCTION
  end

  def print_book(book_id)
    book = (@library.books.select { |book| book.id == book_id })[0]
    author = (@library.authors.select { |author| author.id == book.author_id })[0]
    puts "The most popular book is book number #{book.id}, title: \"#{book.title}\", author: \"#{author.name}\""
  end

  def print_reader(reader_id)
    reader = (@library.readers.select { |reader| reader.id == reader_id })[0]
    puts  "The reader number #{reader_id} often takes the book.\n"+
          "His data is: name   - #{reader.name},\n"+
          "             email  - #{reader.email},\n"+
          "             city   - #{reader.city},\n"+
          "             street - #{reader.street},\n"+
          "             house  - #{reader.house}\n"
  end

  def print_amount(amount)
    puts "#{amount} people ordered one of the three most popular books"
  end

  def start
    puts "Hello.\nWe are pleased to welcome you to our library"

    loop do
      puts instruction
      operation = gets.chomp

      case operation
        when '1'
          @library = Archivist.load
        when '2'
          print_book @library.bestseller
        when '3'
          print_reader @library.booklover
        when '4'
          print_amount @library.top_orders_amount
        when '5'
          Archivist.save(@library)
        when '6'
          Populator.populate_data(@library)
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
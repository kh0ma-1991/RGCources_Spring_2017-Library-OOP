require './lib/library/models.rb'
require 'set'
require './lib/library/librarian.rb'

class Library

  attr_reader :books, :orders, :readers, :authors

  def initialize
    @books = []
    @orders = []
    @readers = []
    @authors = []
  end
  
  def bestseller
    book_id = popular(:book_id)
    print_book(book_id)
  end

  def booklover
    reader_id = popular(:reader_id)
    print_reader(reader_id)
  end

  def top_orders_amount
    books = top3_books
    who_order = Set.new
    @orders.each do |order|
        who_order.add(order.reader_id) if (books.include?(order.book_id))
    end
    print_amount(who_order.length)
  end

  def top3_books
    populars = populars(:book_id)
    populars = Hash[populars.sort_by { |book_id, amount| -amount }]
    populars.keys[0..2].collect { |item| item.to_s.to_i }
  end

  def populars(stuff)
    populars = Hash.new(0)
    @orders.each { |order| populars[order.send(stuff).to_s.to_sym] += 1 }
    populars
  end

  def popular(stuff)
    populars = populars(stuff)
    amount, result = 0, 0
    populars.each do |key, value|
      if (value > amount)
        amount = value
        result = key.to_s.to_i
      end
    end
    result
  end

  def print_book(book_id)
    book = (@books.select { |book| book.id == book_id })[0]
    author = (@authors.select { |author| author.id == book.author_id })[0]
    "The most popular book is book number #{book.id}, title: \"#{book.title}\", author: \"#{author.name}\""
  end

  def print_reader(reader_id)
    reader = (readers.select { |reader| reader.id == reader_id })[0]
    "The reader number #{reader_id} often takes the book.\n"+
        "His data is: name   - #{reader.name},\n"+
        "             email  - #{reader.email},\n"+
        "             city   - #{reader.city},\n"+
        "             street - #{reader.street},\n"+
        "             house  - #{reader.house}\n"
  end

  def print_amount(amount)
    "#{amount} people ordered one of the three most popular books"
  end

  private :print_book, :print_reader, :print_amount, :popular, :populars, :top3_books

end

@library = Library.new
librarian = Librarian.new(@library)
librarian.start




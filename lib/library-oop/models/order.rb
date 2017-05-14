require './lib/library-oop/models/item'

class Order < Item
  attr_accessor :book_id, :reader_id, :date

  def initialize(args)
    super args
    @book_id = args[:book_id]
    @reader_id = args[:reader_id]
  end
end
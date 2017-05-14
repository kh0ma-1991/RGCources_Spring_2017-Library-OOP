require './lib/library-oop/models/item'

class Book < Item
  attr_accessor :title, :author_id

  def initialize(args)
    super args
    @title = args[:title]
    @author_id = args[:author_id]
  end
end
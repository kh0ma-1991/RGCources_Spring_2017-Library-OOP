require './lib/library-oop/models/item'

class Human < Item
  attr_accessor :name

  def initialize(args)
    super args
    @name = args[:name]
  end
end
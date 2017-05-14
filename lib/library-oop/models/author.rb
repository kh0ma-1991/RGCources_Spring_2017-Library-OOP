require './lib/library-oop/models/human'

class Author < Human
  attr_accessor :biography

  def initialize(args)
    super args
    @biography = args[:biography]
  end
end
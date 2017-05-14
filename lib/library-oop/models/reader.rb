require './lib/library-oop/models/human'

class Reader < Human
  attr_accessor :email, :city, :street, :house

  def initialize(args)
    super args
    @email = args[:email]
    @city = args[:city]
    @street = args[:street]
    @house = args[:house]
  end
end
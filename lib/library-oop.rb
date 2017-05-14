require './lib/library-oop/librarian.rb'
require './lib/library-oop/models/library'

library = Library.new
librarian = Librarian.new(library)
librarian.start
require './lib/library/models.rb'
require 'yaml'

class Library
  attr_reader :books, :orders, :readers, :authors

  def initialize
    @books = []
    @orders = []
    @readers = []
    @authors = []
  end
end
# puts Models::Item.global_id = 1000
# puts Models::Book.new({title: 'Hello', author_id: 1}).inspect
# puts Models::Book.new({title: 'Poke', author_id: 2}).inspect
# puts Models::Book.new({title: 'Privet', author_id: 3}).inspect
# puts Models::Book.new({title: 'Otvet', author_id: 4}).inspect
#
# puts Models::Author.new({name: 'Sheva', biography: 'dddddddddddddddddddddddddd'}).inspect

# Models::Item.global_id = 1000
# test = Models::Book.new({title: 'Hello', author_id: 1})
# puts test.inspect
# puts test.class
# puts test = YAML.dump(test)
# test = YAML.load(test)
# puts test.inspect
# puts test.class
#
# puts Models::Book.new({title: 'Hello2', author_id: 2}).inspect

library = Library.new

library.authors << Models::Author.new({name: 'Taras Shevchenko', biography: 'Taras Hryhorovich Shevchenko, the great Ukrainian poet, artist and thinker, was born on March 9, 1814, in the village of Moryntsi in central Ukraine, then part of the Russian Empire. His parents, H. Shevchenko and K. Shevchenko, were serfs on the land of V. Engelhardt.'})
library.authors << Models::Author.new({name: 'Ivan Levitsky',    biography: 'Ivan Levitsky, pseudonym of Ivan Nechuy-levitsky, also spelled Nechúi-levýtsky, or Nečuj-levycʾkyj (born Nov. 25 [Nov. 13, old style], 1838, Steblev, Kiev province, Ukraine, Russian Empire—died April 15 [April 2, O.S.], 1918, Kiev), Ukrainian Realist novelist of the postserfdom reform period. He drew upon his background as a seminary student and, later, a provincial teacher, to depict the educated and lower classes in some of the earliest social novels in Ukrainian literature. His works include Prichepa (1869; “The Intruder”), Khmari (1874; “Clouds”), Kaydasheva semya (1879; “The Kaydashev Family”), and Burlachka (1881; “A Factory Girl”). Use of objective narrative and details of folklore strengthen the realistic effect of his works.'})
library.authors << Models::Author.new({name: 'Lesya Ukrainka',   biography: 'Lesya Ukrainka, pseudonym of Larisa Petrovna Kosach-kvitka (born Feb. 13 [Feb. 25, New Style], 1871, Novograd-Volynsky, Ukraine, Russian Empire [now Novohrad-Volynskyy, Ukraine]—died July 19 [Aug. 1], 1913, Surami, Georgia, Russian Empire [now in Georgia]), poet, dramatist, short-story writer, essayist, and critic who was the foremost woman writer in Ukrainian literature and a leading figure in its modernist movement.'})

library.books << Models::Book.new({title: 'Kobzar',                   author_id: 1}) #4
library.books << Models::Book.new({title: 'Haidamaks, The',           author_id: 1}) #5
library.books << Models::Book.new({title: 'Dream, The',               author_id: 1}) #6
library.books << Models::Book.new({title: 'Kaydasheva semya',         author_id: 2}) #7
library.books << Models::Book.new({title: 'Prichepa',                 author_id: 2}) #8
library.books << Models::Book.new({title: 'In the Catacombs',         author_id: 3}) #9
library.books << Models::Book.new({title: 'The Babylonian Captivity', author_id: 3}) #10

library.readers << Models::Reader.new({name: 'Nazar', email: 'nazar@ukr.net',  city: 'Lviv',   street: 'Shevchenko',   house: 33}) #11
library.readers << Models::Reader.new({name: 'Ivan',  email: 'ivan@gmail.com', city: 'Dnipro', street: 'A.Polya',      house: 15}) #12
library.readers << Models::Reader.new({name: 'Anna',  email: 'anna@i.ua',      city: 'Kyiv',   street: 'Khreshchatyk', house: 11}) #13

library.orders << Models::Order.new({book_id: 4, reader_id: 11, date: Time.new(2016, 10, 31)})
library.orders << Models::Order.new({book_id: 7, reader_id: 12, date: Time.new(2016, 11, 21)})
library.orders << Models::Order.new({book_id: 9, reader_id: 13, date: Time.new(2016, 12, 14)})

puts library.inspect


test = library
puts test.inspect
puts test.class
puts test = YAML.dump(test)
test = YAML.load(test)
puts test.inspect
puts test.class

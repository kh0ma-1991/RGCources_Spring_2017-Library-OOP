require './lib/library-oop/models/author'
require './lib/library-oop/models/book'
require './lib/library-oop/models/reader'
require './lib/library-oop/models/order'

class Populator
  def self.populate_data(library)
    library.authors << Author.new({name: 'Taras Shevchenko', biography: 'Taras Hryhorovich Shevchenko, the great Ukrainian poet, artist and thinker, was born on March 9, 1814, in the village of Moryntsi in central Ukraine, then part of the Russian Empire. His parents, H. Shevchenko and K. Shevchenko, were serfs on the land of V. Engelhardt.'})
    library.authors << Author.new({name: 'Ivan Levitsky',    biography: 'Ivan Levitsky, pseudonym of Ivan Nechuy-levitsky, also spelled Nechúi-levýtsky, or Nečuj-levycʾkyj (born Nov. 25 [Nov. 13, old style], 1838, Steblev, Kiev province, Ukraine, Russian Empire—died April 15 [April 2, O.S.], 1918, Kiev), Ukrainian Realist novelist of the postserfdom reform period. He drew upon his background as a seminary student and, later, a provincial teacher, to depict the educated and lower classes in some of the earliest social novels in Ukrainian literature. His works include Prichepa (1869; “The Intruder”), Khmari (1874; “Clouds”), Kaydasheva semya (1879; “The Kaydashev Family”), and Burlachka (1881; “A Factory Girl”). Use of objective narrative and details of folklore strengthen the realistic effect of his works.'})
    library.authors << Author.new({name: 'Lesya Ukrainka',   biography: 'Lesya Ukrainka, pseudonym of Larisa Petrovna Kosach-kvitka (born Feb. 13 [Feb. 25, New Style], 1871, Novograd-Volynsky, Ukraine, Russian Empire [now Novohrad-Volynskyy, Ukraine]—died July 19 [Aug. 1], 1913, Surami, Georgia, Russian Empire [now in Georgia]), poet, dramatist, short-story writer, essayist, and critic who was the foremost woman writer in Ukrainian literature and a leading figure in its modernist movement.'})

    library.books << Book.new({title: 'Kobzar',                   author_id: 1}) #4
    library.books << Book.new({title: 'Haidamaks, The',           author_id: 1}) #5
    library.books << Book.new({title: 'Dream, The',               author_id: 1}) #6
    library.books << Book.new({title: 'Kaydasheva semya',         author_id: 2}) #7
    library.books << Book.new({title: 'Prichepa',                 author_id: 2}) #8
    library.books << Book.new({title: 'In the Catacombs',         author_id: 3}) #9
    library.books << Book.new({title: 'The Babylonian Captivity', author_id: 3}) #10

    library.readers << Reader.new({name: 'Nazar',  email: 'nazar@ukr.net',  city: 'Lviv',     street: 'Shevchenko',   house: 33}) #11
    library.readers << Reader.new({name: 'Ivan',   email: 'ivan@gmail.com', city: 'Dnipro',   street: 'A.Polya',      house: 15}) #12
    library.readers << Reader.new({name: 'Anna',   email: 'anna@i.ua',      city: 'Kyiv',     street: 'Khreshchatyk', house: 11}) #13
    library.readers << Reader.new({name: 'Anton',  email: 'anton@cek.net',  city: 'Mariupol', street: 'Gretska',      house: 158})#14
    library.readers << Reader.new({name: 'Bogdan', email: 'bg1991@me.com',  city: 'Vorokhta', street: 'Lisova',       house: 17}) #15
    library.readers << Reader.new({name: 'Nino',   email: 'heilei@cc.ua',   city: 'Boryslav', street: 'Naftova',      house: 77}) #16

    library.orders << Order.new({book_id: 4,  reader_id: 11, date: Time.new(2016, 10, 31)})
    library.orders << Order.new({book_id: 5,  reader_id: 12, date: Time.new(2016, 11, 21)})
    library.orders << Order.new({book_id: 6,  reader_id: 15, date: Time.new(2016, 12, 14)})
    library.orders << Order.new({book_id: 4,  reader_id: 11, date: Time.new(2015, 07, 04)})
    library.orders << Order.new({book_id: 5,  reader_id: 12, date: Time.new(2015, 11, 03)})
    library.orders << Order.new({book_id: 6,  reader_id: 13, date: Time.new(2015, 02, 14)})
    library.orders << Order.new({book_id: 4,  reader_id: 11, date: Time.new(2017, 01, 12)})
    library.orders << Order.new({book_id: 5,  reader_id: 12, date: Time.new(2017, 02, 28)})
    library.orders << Order.new({book_id: 6,  reader_id: 16, date: Time.new(2017, 03, 07)})

    library.orders << Order.new({book_id:  7,  reader_id: 14, date: Time.new(2016, 10, 31)})
    library.orders << Order.new({book_id:  8,  reader_id: 15, date: Time.new(2016, 11, 21)})
    library.orders << Order.new({book_id:  9,  reader_id: 16, date: Time.new(2016, 12, 14)})
    library.orders << Order.new({book_id: 10,  reader_id: 14, date: Time.new(2015, 07, 04)})
    library.orders << Order.new({book_id:  7,  reader_id: 15, date: Time.new(2015, 11, 03)})
    library.orders << Order.new({book_id:  9,  reader_id: 16, date: Time.new(2015, 02, 14)})

    puts 'Data was populated successfully'
  end
end
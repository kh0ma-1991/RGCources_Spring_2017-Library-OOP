module Models
  class Item
    attr_accessor :id
    def initialize(args)
      @id = args.include?(:id) ? args[:id] : Item.next_id
    end
    class << self
      attr_writer :global_id

      def next_id
        @global_id = 0 unless @global_id
        @global_id += 1
      end
    end
  end

  class Book < Item
    attr_accessor :title, :author_id

    def initialize(args)
      super args
      @title = args[:title]
      @author_id = args[:author_id]
    end
  end

  class Order < Item
    attr_accessor :book_id, :reader_id, :date

    def initialize(args)
      super args
      @book_id = args[:book_id]
      @reader_id = args[:reader_id]
    end
  end

  class Human < Item
    attr_accessor :name

    def initialize(args)
      super args
      @name = args[:name]
    end
  end

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

  class Author < Human
    attr_accessor :biography

    def initialize(args)
      super args
      @biography = args[:biography]
    end
  end
end
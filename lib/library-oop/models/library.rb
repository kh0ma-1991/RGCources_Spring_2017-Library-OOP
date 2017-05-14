class Library

  attr_reader :books, :orders, :readers, :authors

  def initialize
    @books = []
    @orders = []
    @readers = []
    @authors = []
  end

  def bestseller
    orders.group_by(&:book_id)
          .sort_by { |_, v| v.length }
          .last[0]
  end

  def booklover
    orders.group_by(&:reader_id)
          .sort_by { |_, v| v.length }
          .last[0]
  end

  def top_orders_amount
    orders.group_by(&:book_id)
          .max_by(3) { |_, v| v.length }
          .flat_map  { |el| el[1] }
          .collect(&:reader_id)
          .uniq
          .length
  end
end
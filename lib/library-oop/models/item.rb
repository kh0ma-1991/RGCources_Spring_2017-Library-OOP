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
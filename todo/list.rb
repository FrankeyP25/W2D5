require_relative "./item.rb"
class List

    LINE_WIDTH = 42
    INDEX_COL_WIDTH = 5
    ITEM_COL_WIDTH = 20
    DEADLINE_COL_WIDTH = 10

    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        item = Item.new(title, deadline, description)
        if !Item.valid_date?(deadline)
            return false
        else
            @items << item
            return true
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
      index <= 0 && index < self.size
    end

    def swap(i1, i2)
        return false if !self.valid_index?(i1) && !self.valid_index?(i2)
        @items[i1], @items[i2] = @items[i2], @items[i1]
        true
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        @items[0]
    end
    # def print
    #     puts "-" * LINE_WIDTH
    #     puts " " * 16 + self.label.upcase
    #     puts "-" * LINE_WIDTH
    #     puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)}"
    #     puts "-" * LINE_WIDTH
    #     @items.each_with_index do |item, i|
    #         puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)}"
    #     end
    #     puts "-" * LINE_WIDTH
    # end

    # def print_full_item(index)
    #     item = self[index]
    #     return if item.nil?
    #     puts "-" * LINE_WIDTH
    #     puts "#{item.title.ljust(LINE_WIDTH/2)}#{item.deadline.rjust(LINE_WIDTH/2)}"
    #     puts item.description
    #     puts "-" * LINE_WIDTH
    # end

    # def print_priority(i)
    #     print_full_item(0)
    # end

    def up(i, amount=1)
        return nil if !valid_index?(i)
        while amount > 0 && i != 0
            swap(i, i - 1)
            index -= 1
            amount -= 1 
        end 
        true
    end

    def down(i, amount=1)
        return nil if !valid_index?(i)
        while amount > 0 && i != size - 1
          swap(i, i + 1)
          index += 1
          amount -= 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline  }
    end
end
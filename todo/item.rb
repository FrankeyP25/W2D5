class Item
    def self.valid_date?(date)
        arr = date.split("-")
        y = arr[0].to_i
        m = arr[1].to_i
        d = arr[2].to_i
        return false if y < 1000
        return false if m > 12
        return false if d > 31
        true
    end
    
    attr_reader :deadline
    attr_accessor :title, :description
    def initialize(title, deadline, description)
        raise "invalid date" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline=(new_deadline)
        return false if raise "deadline is not valid" if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
        true
    end
end


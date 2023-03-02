class Cell
    attr_read: row, column
    attr_accessor: tick_tack
    
    def initialize(row, column)
        @row = row
        @column = column
        @tick_tack = nil
    end

    def mark(sign)
        @tick_tack = sign
    end
end


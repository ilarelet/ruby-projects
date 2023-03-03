class Cell
    attr_reader :row, :column
    attr_accessor :sign
    
    def initialize(num)
        @num
        @sign = nil
    end
    #Marking a cell with a sign (X or 0)
    def mark(sign)
        @sign = sign
    end
end

class Player
    def initialize(name, sign)
        @name = name
        @sign = sign
    end
    
    #player's turn
    def turn(field)
        puts "Choose a row: "
        row = gets.to_i
        puts "Choose a column: "
        column = gets.to_i
        if field[row][column] == nil
            field[row][column].mark(@sign)
        else
            puts "This cell is already marked"
            self.turn(field)
        end
    end
end

class Field
    attr_accessor :cells
    def initialize
        @cells = Array.new(9)
        #Filling the one-dimensional array with cells
        #[0][1][2]
        #[3][4][5]
        #[6][7][8]
        @cells.each_index do |index, cell| 
            cells[index] = Cell.new(cell)
        end
        @lines = [
            [cells[0],cells[1],cells[2]],
            [cells[3],cells[4],cells[5]],
            [cells[6],cells[7],cells[8]],
            [cells[0],cells[3],cells[6]],
            [cells[1],cells[4],cells[7]],
            [cells[2],cells[5],cells[8]],
            [cells[0],cells[4],cells[8]],
            [cells[2],cells[4],cells[6]]]        
    end

    #check if there is a full line
    def is_full_line?(sign)
        lines.each do |line|
            if line[0] == line[1] == line[2] == sign do
                return true
            end
        end
        return false
    end
end

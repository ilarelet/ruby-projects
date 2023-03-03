class Cell
    attr_reader :num
    attr_accessor :sign
    
    def initialize(num)
        @num = num
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
        puts "Choose a cell: "
        begin
            choice = gets.to_i
        rescue
            puts "Your choice is invalid. A correct cell number (1 to 9) is required: "
            self.turn(field)
        else
            if choice <= 8 and choice >= 0 and field.cells[choice-1].sign == nil
                field.cells[choice-1].mark(@sign)
            else
                puts "This cell is already marked or the number is invalid"
                self.turn(field)
            end
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
            @cells[index] = Cell.new(index)
        end
        #straight lines - to be checked after each turn
        @lines = [
            [@cells[0],@cells[1],@cells[2]],
            [@cells[3],@cells[4],@cells[5]],
            [@cells[6],@cells[7],@cells[8]],
            [@cells[0],@cells[3],@cells[6]],
            [@cells[1],@cells[4],@cells[7]],
            [@cells[2],@cells[5],@cells[8]],
            [@cells[0],@cells[4],@cells[8]],
            [@cells[2],@cells[4],@cells[6]]]        
    end

    #check if there is a full line
    def is_full_line?(sign)
        @lines.each do |line|
            if line[0] == line[1] and line[0] == line[2] and line[0] == sign
                return true
            end
        end
        return false
    end

    #printing the graph in the console to see current situation
    def draw
        @cells.each do |cell|
            print "|#{cell.num+1}: #{cell.sign} | "
            if cell.num == 2 or cell.num == 5 or cell.num == 8
                print "\n"
            end
        end
    end
end

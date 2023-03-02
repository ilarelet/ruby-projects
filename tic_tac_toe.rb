class Cell
    attr_reader :row, :column
    attr_accessor :sign
    
    def initialize(row, column)
        @row = row
        @column = column
        @sign = nil
    end
    #Marking a cell with a sign (X or 0)
    def mark(sign)
        @sign = sign
    end
end

#Creating the two-dimensional array
rows = 0..2
columns = 0..2
field = Array.new(3){Array.new(3)}
#Filling the array with Cells
rows.each do |row| 
    columns.each do |column|
        field[row][column] = Cell.new(row, column)
    end
end

#player's turn
def turn(player)
    puts "Choose a row: "
    row = gets.to_i
    puts "Choose a column: "
    column = gets.to_i
    if field[row][column] == nil
        field[row][column].mark(player)
    else
        puts "This cell is already marked"
    end
end

#check if the game's over
def check
    rows.each do |row| 
        if field[row][0] == field[row][1] == field[row][2] != nil
            return true
        end
    end
    column.each do |column| 
        if field[0][column] == field[1][column] == field[2][column] != nil
            return true
        end
    end
    if field[0][0] == field[1][1] == field[2][2] != nil
        return true
    end
    if field[0][2] == field[1][1] == field[2][0] != nil
        return true
    end
    return false
end
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
    attr_reader :name, :id
    attr_accessor :sign
    @@players = []

    def initialize(id, sign)
        puts "Player ##{id}, enter your name: "
        @name = gets.chomp
        @sign = sign
        @@players.push(self)
    end

    def self.all_players
        @@players
    end
    
    #player's turn
    def turn(field)
        puts "#{@name}, choose a cell: "
        begin
            choice = gets.to_i
        rescue
            puts "Your choice is invalid. A correct cell number (1 to 9) is required: "
            self.turn(field)
        else
            if choice <= 9 and choice >= 1 and field.cells[choice-1].sign == nil
                field.cells[choice-1].mark(@sign)
            else
                puts "This cell is already marked or the number is invalid"
                self.turn(field)
            end
        end
        field.draw
    end
end

class Field
    attr_accessor :cells, :players

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
    def has_full_line?(sign)
        @lines.each do |line|
            if line[0].sign == line[1].sign and line[0].sign == line[2].sign and line[0].sign == sign
                return true
            end
        end
        return false
    end

    #check of there are no empty cells left
    def is_full?
        @cells.each do |cell|
            if cell.sign == nil
                return false
            end
        end
        return true
    end

    #printing the graph in the console to see current situation
    def draw
        @cells.each do |cell|
            print "|#{cell.num + 1}: #{cell.sign} | "
            if cell.num == 2 or cell.num == 5 or cell.num == 8
                print "\n"
            end
        end
    end
end

#Creating a new game
game_field = Field.new
#Initializing ther players
player1 = Player.new(1, 'X')
player2 = Player.new(2, '0')
puts "Welcome, #{player1.name} and #{player2.name}! Let's begin!"
game_field.draw

#Game flow
game_over=false

until game_over
    Player.all_players.each do |current_player|
        current_player.turn(game_field)
        game_over = game_field.has_full_line?(current_player.sign)
        #If the field has a full line of the same sign the game is over
        if game_over
            puts "Cogratulations! #{current_player.name} won!"
            break
        end
        #If the field is all full the game ends in a tie
        if game_field.is_full?
            puts "It's a tie! There are no empty cells left."
            game_over = true
            break
        end
    end    
end
puts "Game over!"
require_relative "card.rb"
require "byebug"

class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(4){Array.new(4){Card.new}}
    end

    def [](position)
        row,col = position
        @grid[row][col]
    end

    def []=(position,value)
        row,col = position
        @grid[row][col] = value
    end

    def populate
        values = [:A,:B,:C,:D,:E,:F,:G,:H]
        values.each do |v|
            until @grid.flatten.count {|card| card.value == v} == 2
            # debugger
                row = rand(0...@grid.length)
                col = rand(0...@grid.length)
                pos = [row,col]
                self[pos].value = v if self[pos].value == nil
            end
        end
    end

    def render
        rows = []

        @grid.each do |row|
            level = []
            row.each do |card|
                if card.face_up
                    level << card.value
                else
                    level << "_"
                end
            end
            rows << level
        end

        puts "   0 1 2 3"

        rows.each_with_index do |row, i|
            p "#{i} " + row.join(" ")

        #     # row.each do |card|
        #     #     # if card.face_up
        #     #         p "#{card.value} "
        #     #     # else
        #     #     #     p "  "
        #     #     # end
        #     # end
        end
    end

    def won?

        @grid.flatten.all? { |cell| cell.face_up}


    end

    def reveal(guessed_pos)
        if self[guessed_pos].face_up == false
            self[guessed_pos].face_up = true
        end
        self[guessed_pos].value
    end
end

b1 = Board.new
b1.populate
# b1.render

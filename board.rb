require_relative "card.rb"

class Board

    def initialize
        @grid = Array.new(4) {Array.new(4, Card.new)}
    end

    def [](position)
        row,col = position
        @grid[row][col]
    end

    def [](position,value)
        row,col = position
        @grid[row][col] = value
    end

    def populate
        values = [:A,:B,:C,:D,:E,:F,:G,:H]
        values.each do |v|
            until @grid.flatten.count {|card| card.value == v} == 2
                row = rand(0...@grid.length)
                col = rand(0...@grid.length)
                pos = row,col
                @grid[pos].value = v if @grid[pos].value == nil
            end
        end
    end

    def render
        puts "0 1 2 3"
        @grid.each_with_index do |row, i| 
            p "#{i} "
            row.each do |card| 
                if card.face_up
                    p "#{card.value} "
                else
                    p "  "
                end
            end
        end
    end

    def won?
    end

    def reveal
    end
end
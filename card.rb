class Card
    attr_accessor :value, :face_up, :face_down

    def initialize
        @value = nil
        @face_up = false
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    # def to_s
    # end

    # def ==()


    # end
end

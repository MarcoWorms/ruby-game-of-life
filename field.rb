class Field
    def initialize(width, height)
        @field = Array.new(width) { Array.new(height) { Cell.new } }
    end
end

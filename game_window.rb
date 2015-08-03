class Game_window < Gosu::Window
    def initialize(interval)
        super(500,500)
        @timer = Timer.new(interval)
        @field = Field.new(50, 50)
        self.caption = "Conway's Game of Life"
        @field.field[10][10].is_alive = true
        @field.field[11][10].is_alive = true
        @field.field[10][11].is_alive = true
        @field.field[13][13].is_alive = true
        @field.field[12][13].is_alive = true
        @field.field[13][12].is_alive = true
    end

    def update
        if @timer.time_for_next_generation?
            @field.start_next_generation
        end
    end

    def draw
        @field.draw
    end
end
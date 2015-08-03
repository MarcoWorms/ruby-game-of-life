class Game_window < Gosu::Window
    def initialize(fps)
        super(500,500)
        @timer = Timer.new(fps)
        @field = Field.new(10, 10)
        self.caption = "Conway's Game of Life"
    end

    def update
        if @timer.time_for_next_generation?

        end
    end

    def draw

    end
end
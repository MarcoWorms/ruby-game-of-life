class Game_window < Gosu::Window
    def initialize(interval)
        super(700,700)
        @timer = Timer.new(interval)
        @field = Field.new(70, 70)
        self.caption = "Conway's Game of Life"
        @game_state = "paused"
    end

    def update
        self.caption = @game_state
        if @timer.time_for_next_generation?
            if @game_state == "playing"
                @field.evaluate_next_generation
                @field.update_generation
            end
        end
    end

    def draw
        @field.draw
    end

    def button_down(id)
        case id

        when Gosu::KbSpace
            if @game_state == "paused"
                @game_state = "playing"
            elsif @game_state == "playing"
                @game_state = "paused"
            end

        when Gosu::MsLeft
            @field.click(self.mouse_x, self.mouse_y)

        end

    end

    def needs_cursor?
        return true
    end
end
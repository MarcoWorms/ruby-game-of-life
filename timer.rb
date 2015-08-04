class Timer
    def initialize(interval)
        @interval = interval * 10
        @last_recorded_time = 0
    end

    def time_for_next_generation?

        time = Gosu::milliseconds / 100

        its_time = (time % @interval == 0)

        can_tick = (time != @last_recorded_time)

        if its_time && can_tick
            @last_recorded_time = time
            return true
        else
            return false
        end
    end


end
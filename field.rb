class Field

	attr_accessor :field

    def initialize(width, height)
    	@width = width
    	@height = height
    	@size_x = @width - 1
    	@size_y = @height - 1
        @field = Array.new(@width) { Array.new(@height) { Cell.new } }
    end

    def start_next_generation
    	for x in 0..@size_x
    		for y in 0..@size_y
    			cell = @field[x][y]

    			live_neighbors = get_live_neighbors(x, y)

    			if cell.is_alive
	    			if live_neighbors == 1
	    				cell.is_alive = false
	    			elsif live_neighbors == 2 || live_neighbors == 3
	    				cell.is_alive = true
	    			elsif live_neighbors > 3
	    				cell.is_alive = false
	    			end
	    		else
	    			if live_neighbors == 3
	    				cell.is_alive = true
	    			end
	    		end

    		end
    	end
    end

    def get_live_neighbors(x, y)
		live_neighbors = 0  	
		for new_x in -1..1
			for new_y in -1..1
				begin
					if @field[new_x + x][new_y + y].is_alive
						if new_x == 0 && new_y == 0
							next
						end
						live_neighbors += 1
					end
				rescue
					next
				end
			end
		end
		return live_neighbors
    end

    def draw
    	for x in 0..@size_x
    		for y in 0..@size_y
    			cell = @field[x][y]
    			cell.draw(x,y)
    		end
    	end
    end


end

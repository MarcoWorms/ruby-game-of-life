class Field

	attr_accessor :field

    def initialize(width, height)
    	@width = width
    	@height = height
    	@size_x = @width - 1
    	@size_y = @height - 1
        cell_alive_image = Gosu::Image.new("live_cell.png")
        cell_dead_image = Gosu::Image.new("dead_cell.png")
        @field = Array.new(@width) { Array.new(@height) { Cell.new(cell_alive_image, cell_dead_image) } }
    end

    def evaluate_next_generation
    	for x in 0..@size_x
    		for y in 0..@size_y
    			cell = @field[x][y]

    			live_neighbors = get_live_neighbors(x, y)

    			if cell.is_alive
	    			if live_neighbors <= 1
	    				cell.is_alive_again = false
	    			elsif live_neighbors == 2 || live_neighbors == 3
	    				cell.is_alive_again = true
	    			elsif live_neighbors > 3
	    				cell.is_alive_again = false
	    			end
	    		else
	    			if live_neighbors == 3
	    				cell.is_alive_again = true
	    			end
	    		end

    		end
    	end
    end

    def update_generation
        for x in 0..@size_x
            for y in 0..@size_y
                cell = @field[x][y]
                cell.is_alive = cell.is_alive_again
            end
        end
    end

    def get_live_neighbors(x, y)
		live_neighbors = 0
		for new_x in -1..1
			for new_y in -1..1
                neigh_x = new_x + x
                neigh_y = new_y + y
                valid_position = (neigh_x >= 0 && neigh_x < @width && neigh_y >= 0 && neigh_y < @height)
                if valid_position
					if @field[neigh_x][neigh_y].is_alive
						if new_x == 0 && new_y == 0
							next
						end
						live_neighbors += 1
					end
                end
			end
		end
		return live_neighbors
    end

    def click(mouse_x, mouse_y)
        grid_x = mouse_x / 10 #cell size
        grid_y = mouse_y / 10
        cell_clicked = @field[grid_x][grid_y]
        if cell_clicked.is_alive
            cell_clicked.is_alive = false
            cell_clicked.is_alive_again = false

        else
            cell_clicked.is_alive = true
            cell_clicked.is_alive_again = true
        end
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

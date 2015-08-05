class Field

	attr_accessor :field

    def initialize(width, height)
    	@width = width
    	@height = height
    	@size_x = @width - 1
    	@size_y = @height - 1
        @field = make_2d_array_with_cells
    end

    def make_2d_array_with_cells
        Array.new(@width) {
            Array.new(@height) {
                Cell.new(Images::Live_cell, Images::Dead_cell)
            }
        }
    end

    def each_cell
        for x in 0..@size_x
            for y in 0..@size_y
                cell = @field[x][y]
                yield cell, x, y
            end
        end
    end

    def evaluate_next_generation
        self.each_cell do |cell, x ,y|

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

    def update_generation
        self.each_cell do |cell|
                cell.is_alive = cell.is_alive_again
        end
    end

    def get_live_neighbors(x, y)
		live_neighbors = 0
		for delta_x in -1..1
			for delta_y in -1..1
                neighbor_x = delta_x + x
                neighbor_y = delta_y + y
                valid_position = (neighbor_x >= 0 && neighbor_x < @width && neighbor_y >= 0 && neighbor_y < @height)
                if valid_position
                    neighbor = @field[neighbor_x][neighbor_y]
					if neighbor.is_alive
						if delta_x == 0 && delta_y == 0
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
    	self.each_cell do |cell, x, y|
    			cell.draw(x,y)
    	end
    end

end

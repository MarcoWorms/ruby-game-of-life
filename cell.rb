class Cell

	attr_accessor :is_alive, :is_alive_again

	def initialize(alive_image, dead_image)
		@is_alive = false
        @is_alive_again = false
		@size_in_square_pixels = 10
		@alive_image = alive_image
		@dead_image = dead_image
	end

	def draw(x,y)
		interface_x = x * @size_in_square_pixels
		interface_y = y * @size_in_square_pixels
		if @is_alive
			@alive_image.draw(interface_x, interface_y, 1)
		else
			@dead_image.draw(interface_x, interface_y, 1)
		end
	end
end
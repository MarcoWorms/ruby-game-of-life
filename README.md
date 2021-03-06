###**Game of Life**
To run on windows just open "Game of Life.exe"

If it fails, take the images from "assets" and put them in the root directory of the game

To run on ruby just do the following:

 - ruby main.rb

If you do not have Gosu you should install it before running (you don't need to do this if you use the windows .exe)

 - gem install gosu

###**How to play**
This is a copy of "Conway's Game of Life", if you want more info on this game you can find it here https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

The game starts paused, you can click anywhere in the screen to create or kill cells. Press spacebar to unpause/pause again.


###**Rules**
(taken from the wikipedia page above)

The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead. Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

- Any live cell with fewer than two live neighbours dies, as if caused by under-population.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any live cell with more than three live neighbours dies, as if by overcrowding.
- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

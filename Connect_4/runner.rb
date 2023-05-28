
require './lib/board'
require './lib/game'
require './lib/computer_player'
require './lib/human_player'
require 'pry'
require 'daru'
require 'pp'

p "Please enter username."
@username = gets.chomp
p "Hi #{@username}, welcome to Connect 4!"
p "Although they're quite simple, here are the rules:"
p "1: Your pieces are an X, the computer is O."
p "2: Either horizontally, vertically, or diagonally,"
p "   try to connect 4 of your pieces in a row."
p "3: Only columns A, B, C, D, E, F, and G are accepted as valid input."
puts
puts
p "~~~~~Good luck!~~~~~"

 game = Game.new
 game.play
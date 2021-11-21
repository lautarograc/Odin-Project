require_relative "../lib/tic_tac_toe.rb"
 
puts "Welcome to tic tac toe"
Lautaro = TicTacToe::Player.new({color: "X", name: "Lautaro"})
Martin = TicTacToe::Player.new({color: "O", name: "Martin"})
players = [Lautaro, Martin]
TicTacToe::Game.new(players).play
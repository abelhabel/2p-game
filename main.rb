require 'colorize'
require './game.rb'
require './tournament'

def games_loop(game)
  game.main_loop!

  puts "Do you want to play again? (Y/N)"
  
  if gets.chomp.downcase == 'n'
    return
  else
    game.new_game!
  end

  games_loop(game)
end

def print_rules
  puts "The game will prompt each player in turn with a maths question."
  puts "Giving a wrong answer reduces your HP with 1. Your HP is 3 to begin with."
  puts "Answering correct does not give points or HP, instead the turn goes to the next player."
  puts "The first player who goes to 0 HP has lost and the other player wins."
  puts "Hit any key to start playing."
  gets
end

def run
  #prompt for player names and set them
  
  repeat = true
  p1name = ''
  p2name = ''
  loop do
    puts "Player 1, please input your name:"
    p1name = gets.chomp.strip
    break if p1name != ''
  end
  loop do
    puts "Player 2, please input your name:"
    p2name = gets.chomp.strip
    break if p2name != ''
  end
  print_rules
  tournament = Tournament.new(p1name, p2name)
  if tournament.new_game
    tournament.new_game
  end
  # game = Game.new(p1name, p2name)
  # games_loop(game)
end

run

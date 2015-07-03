#include

require './objects.rb'
require './logic.rb'
require 'colorize'
#init players
@players = [Player.new('p1', 3, 0), Player.new('p2', 3, 0)]
@turn = 0

def print_wrong
  puts "That's wrong!".red
  @players[@turn].wrong_answer
  puts "#{@players[@turn].name}: has #{@players[@turn].get_hp} HP left, and lost!" 
  puts "#{@players[@turn-1].name}: has #{@players[@turn-1].get_hp} HP left, and won!"
end
def play_again()
  puts "Do you want to play again? (Y/N)"
end
def new_game
  @players[0].reset_hp
  @players[1].reset_hp
  @players[@turn-1].increase_score
  @players.each{|x| x.display}
end
def repl
  #get random numbers and print to screen
  numbers = get_question()
  puts "Player: #{@players[@turn].name}, what is : #{numbers[0]} + #{numbers[1]}?"
  reply = gets.chomp.to_i
  #check if player input is correct
  if reply == numbers[0] + numbers[1]
    puts "Correct".green
  else
    print_wrong
    if @players[@turn].get_hp <= 0
      play_again()
      if gets.chomp.downcase == 'n'
        return
      else
        new_game
      end
    end
  end
  @turn = @turn == 0 ? 1 : 0
  repl
end

def intro
  #prompt for player names and set then
  puts "Player 1, please input your name:"
  @players[0].name = gets.chomp
  puts "Player 2, please input your name:"
  @players[1].name = gets.chomp
  #explain rules
  puts "The game will prompt each player in turn with a maths question."
  puts "Giving a wrong answer reduces your HP with 1. Your HP is 3 to begin with."
  puts "Answering correct does not give points or HP, instead the turn goes to the next player."
  puts "The first player who goes to 0 HP has lost and the other player wins."
  puts "Hit any key to start playing."
  gets
end
intro
repl
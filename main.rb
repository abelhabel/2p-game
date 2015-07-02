#include

require './objects.rb'
require './logic.rb'
require 'colorize'
#init players
@players = [Player.new('p1', 3, 0), Player.new('p2', 3, 0)]
@turn = 0
def repl
  
  numbers = get_question()
  puts numbers
  puts "Player: #{@players[@turn].get_name}, what is : #{numbers[0]} + #{numbers[1]}?"
  reply = gets.chomp.to_i
  if reply == numbers[0] + numbers[1]
    puts "Correct".green
  else
    puts "That's wrong!".red
    @players[@turn].wrong_answer
    puts "#{@players[@turn].get_name}: has #{@players[@turn].get_hp} HP left, and lost!" 
    puts "#{@players[@turn-1].get_name}: has #{@players[@turn-1].get_hp} HP left, and won!"
    if @players[@turn].get_hp <= 0
      play_again()
      if gets.chomp.downcase == 'n'
        return
      else
        @players[0].reset_hp
        @players[1].reset_hp
        @players[@turn-1].increase_score
        @players.each{|x| x.display}
      end
    end
  end
  @turn = @turn == 0 ? 1 : 0
  repl
end

def intro
  #prompt for player names and set then
  puts "Player 1, please input your name:"
  @players[0].set_name(gets.chomp)
  puts "Player 2, please input your name:"
  @players[1].set_name(gets.chomp)
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
require './player.rb'
require './logic.rb'

class Game
  def initialize(players)
    @players = players
    @whos_turn = 0 #
  end

  def active_player
    @players[@whos_turn]
  end

  def inactive_player
    @players[@whos_turn-1]
  end

  def next_player
    @whos_turn = @whos_turn == 0 ? 1 : 0
  end

  def print_wrong
    puts "That's wrong!".red
    puts "#{active_player.name}: has #{active_player.hp} HP left, and lost!" 
    puts "#{inactive_player.name}: has #{inactive_player.hp} HP left, and won!"
  end

  def print_correct
    puts "Correct!".green
  end

  def print_score
    puts "-" * 20
    puts "#{active_player.name}, has #{active_player.score} points."
    puts "#{inactive_player.name}, has #{inactive_player.score} points."
    puts "-" * 20
  end

  def new_game!
    active_player.increase_score!
    print_score
    puts "Resetting HP..."
    @players.each{|p| p.reset_hp!}
  end

  def check_answer!(answer, numbers)
    return_str = ''
    if answer == numbers[0] + numbers[1]
      print_correct
    else
      active_player.reduce_hp
      print_wrong
      puts "Player hp #{active_player.hp}!"
      if active_player.hp <= 0
        return false
      end
    end
    return true
  end

  def main_loop!
    while active_player.hp > 0 && inactive_player.hp > 0
      numbers = Logic.get_question()
      puts "Player: #{active_player.name}, what is: #{numbers[0]} + #{numbers[1]}?"
      reply = gets.chomp.to_i
      if check_answer!(reply, numbers)
        next_player
      end
    end
    inactive_player.increase_score

  end
  
end
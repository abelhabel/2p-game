require './game.rb'
class Tournament
  def initialize(p1name, p2name)
    @players = [Player.new(p1name,3,0), Player.new(p2name,3,0)]
  end

  def new_game
    @game = Game.new(@players)
    play
  end

  def print_score
    puts "-" * 20
    puts "#{@players[0].name}, has #{@players[0].score} points."
    puts "#{@players[1].name}, has #{@players[1].score} points."
    puts "-" * 20
  end

  def play
    @game.main_loop!
    puts "Do you want to play again? (Y/N)"
    if gets.chomp.downcase == 'n'
      return false
    end
    print_score
    @players.each { |p| p.reset_hp}
    true
  end
end
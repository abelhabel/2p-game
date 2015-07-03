class Player  
  def initialize(name, hp, score)  
    # Instance variables  
    @name = name 
    @hp = hp
    @score = score
  end  
  attr_accessor :name
  def wrong_answer
    @hp -= 1
  end
  def get_hp
    @hp
  end
  def reset_hp
    @hp = 3
  end
  def increase_score
    @score += 1
  end
  def display
    puts "-" * 20
    puts "#{@name}, has #{@score} points."
    puts "-" * 20
  end

end 
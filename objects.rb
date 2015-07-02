class Player  
  def initialize(name, hp, score)  
    # Instance variables  
    @name = name 
    @hp = hp
    @score = score
  end  
  
  def set_name(name)
    @name = name
  end
  def get_name
    @name
  end
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
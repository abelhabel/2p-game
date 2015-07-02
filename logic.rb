def get_question()
  num1 = rand(1..20)
  num2 = rand(1..20)
  [num1, num2]
end

def play_again()
  puts "Do you want to play again? (Y/N)"
end
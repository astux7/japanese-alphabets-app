#require_relative 'hiragana'
class Quiz

  def initialize(random_question = [])
    @random_question = random_question
  end

  attr_accessor :random_question, :scores, :correct_answer

  def generate_question(number = 4)
  
    @correct_answer = rand(number-1)
    random_letters = (Hiragana::All).shuffle.take(number)
    random_letters.each.with_index{|element, index|
      @random_question << {:answer => element.romaji, :correct => @correct_answer === index ? true : false, :label => element.letter, :guessed => false }
    }
    @random_question
  end

  def game_over?(chosen)
    @correct_answer == chosen
  end

  def move
    #check if answer is taken
   

  end

  def reset
    @random_question = []
  end

end
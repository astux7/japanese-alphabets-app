#require_relative 'hiragana'
class Quiz

QUIZ_QUESTIONS = 4

  def initialize(random_question = [], scores = 0, correct_answer = nil, correct = 0, incorrect = 0)
    @random_question = random_question
    @correct = correct
    @incorrect = incorrect
    @scores = scores
    @correct_answer = correct_answer
  end

  attr_accessor :random_question, :scores, :correct_answer, :incorrect, :correct

  def generate_question(number = QUIZ_QUESTIONS)
    reset(number)
    random_letters = (Hiragana::All).shuffle.take(number)
    random_letters.each.with_index{|element, index|
      @random_question << {:answer => element.romaji, :correct => @correct_answer === index ? true : false, :label => element.letter, :guessed => false }
    }
    @random_question
  end

  def game_over?(chosen)
    @correct_answer === chosen
  end

  def reset(number)
    @random_question = []
    @correct_answer = rand(number)
  end

end
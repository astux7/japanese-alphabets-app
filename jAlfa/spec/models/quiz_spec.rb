#require_relative '../../app/models/quiz'

describe "Quiz" do 
 let(:quiz){Quiz.new}
  describe "Generation quiz" do
    it 'should random 4 Hiragana' do
      expect(quiz.generate_question.count).to eq(4)
    end
    it 'should have 1 answer' do
    
      expect(quiz.generate_question.select {|el|
        el if el[:correct] === true
      }.count).to eq(1)
    end
    it 'should have 3 more possible answers' do
    
      expect(quiz.generate_question.select {|el|
        el if el[:correct] === false
      }.count).to eq(3)
    end
  end
  
end
class QuestionGenerator
  def self.availableQuestions
    [AdditionQuestion, SubtractionQuestion, MultiplicationQuestion]
  end

  def self.generateRandomQuestion
    index = rand(availableQuestions.count)
    availableQuestions[index].new
  end
end

class Question

  def initialize
    @leftOperand = 1 + rand(100)
    @rightOperand = 1 + rand(100)
    generateAnswer
  end

  def question_string
    "What is #{@leftOperand} #{operand} #{@rightOperand}?"
  end

  def correct?(answer)
    @answer == answer
  end

end

class AdditionQuestion < Question
  def generateAnswer
    @answer = @leftOperand + @rightOperand
  end

  def operand
    "+"
  end
end

class SubtractionQuestion < Question
  def generateAnswer
    @answer = @leftOperand - @rightOperand
  end

  def operand
    "-"
  end
end

class MultiplicationQuestion < Question
  def generateAnswer
    @answer = @leftOperand * @rightOperand
  end

  def operand
    "*"
  end
end

require "./question.rb"

class QuestionGenerator
  def self.availableQuestions
    [AdditionQuestion, SubtractionQuestion, MultiplicationQuestion]
  end

  def self.generateRandomQuestion
    index = rand(availableQuestions.count)
    availableQuestions[index].new
  end
end

class PlayerGenerator
  attr_accessor :id, :life

  def initialize(id)
    @id = id
    @life = 3
  end
end

class GameManager
  def initialize
    @players = []
    @round = 1
  end

  def run
      player_A = PlayerGenerator.new('A')
      player_B = PlayerGenerator.new('B')
      current_player = player_A

      while (true) do

        question = QuestionGenerator.generateRandomQuestion
        puts "Round #{@round} - Player #{current_player.id}"
        puts question.question_string
        puts "Enter the answer or enter quit"
        answer = gets.chomp

        if (answer == "quit")
          break
        end

        if (question.correct?(answer.to_i))
          puts "Right!"
        else
          current_player.life -= 1
          puts "Wrong"
        end

        if (current_player == player_A)
          puts "Player #{current_player.id}'s remaining life: #{current_player.life}"
          puts "----------------------"
          current_player = player_B
        else
          if (player_A.life == 0 && player_B.life == 0)
            puts "----------------------"
            puts "Game over: you killed each other"
            break
          elsif (player_B.life == 0)
            puts "----------------------"
            puts "Game over: player A won"
            break
          elsif (player_A.life == 0)
            puts "----------------------"
            puts "Game over: player B won"
            break
          else
            puts "Player #{current_player.id}'s remaining life: #{current_player.life}"
            puts "----------------------"
            current_player = player_A
            @round += 1
          end
        end
      end
    end
end

game = GameManager.new
game.run

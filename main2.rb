require "./question.rb"

class QuestionGenerator
  def self.availableQuestions
    []
  end

  def self.generateQuestion
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
    @round = 1
    @players = []
  end

  def lose_life(players, id)
    index = players.find_index { |player| player[:id] == id }
    players[index][life] -= 1
  end

  def run
    puts "Welcome in Math Battle"
    puts "Please enter the number of players:"

    counter_entry = 0
    while (counter_entry < 3) do
      player_number = gets.chomp
      if
        (player_number.is_a?(Integer) &&
        player_number >= 1 &&
        player_number <= 8)

        player_number.times do |i|
          player = PlayerGenerator.new(i + 1)
          @players << player
        end

      else
        counter_entry += 1
        puts "Please enter a number between 1 and 8"
      end
    end

    puts "Let the battle begin!"

    while (true) do

      current_player = 1
      while (current_player <= player_number) do
        question = QuestionGenerator.generateQuestion
        puts "Round #{@round}: Player #{current_player}"
        puts question.question_text
        puts "Enter your answer or give up by entering quit:"
        answer = gets.chomp

        if (answer == "quit")
          puts "Bye-bye Player #{current_player}"
          @players.delete_if { |player| player.id == current_player }
          break
        elsif (question.correct?(answer.to_i))
          puts "That is correct"
        else
          lose_life(@players, current_player)
        end

        if (current_player == player_number) do
          current_player = 1
          break
        else
          current_player += 1
        end
        
      end
      round += 1

    end

    end

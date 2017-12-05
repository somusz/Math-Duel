class GameManager
  def initialize
    @round = 1
    @gameover = false
  end

  def check_answer(question, answer, current_player)
    if (question.correct?(answer.to_i))
      puts "Right!"
    else
      current_player.life -= 1
      puts "Wrong"
    end
  end

  def player_life_down?(player)
    player.life == 0
  end

  def gameover
    @gameover = true
  end

  def evaluate(player_A, player_B)
    if (player_life_down?(player_A) && player_life_down?(player_B))
      puts "----------------------"
      puts "Game over: you killed each other"
      gameover
    elsif (player_life_down?(player_B))
      puts "----------------------"
      puts "Game over: player A won"
      gameover
    elsif (player_life_down?(player_A))
      puts "----------------------"
      puts "Game over: player B won"
      gameover
    else
    end
  end

  def remaining_life(current_player)
    puts "Player #{current_player.id}'s remaining life: #{current_player.life}"
    puts "----------------------"
  end

  def switch_player(current_player)
    current_player = (current_player + 1) % 2
  end

  def new_round(current_player)
    if (current_player == 1)
      @round += 1
    end
  end

  def run
    player_A = PlayerGenerator.new('A')
    player_B = PlayerGenerator.new('B')
    players = [player_A, player_B]
    current_player = 0

    while (true) do

      question = QuestionGenerator.generateRandomQuestion
      puts "Round #{@round} - Player #{players[current_player].id}"
      puts question.question_string
      puts "Enter the answer or enter quit"
      answer = gets.chomp

      if (answer == "quit")
        break
      end

      check_answer(question, answer, players[current_player])

      evaluate(player_A, player_B) if (current_player == 1)

      @gameover ? break : ""

      remaining_life(players[current_player])

      new_round(current_player)

      current_player = (current_player + 1) % 2

    end
  end
end

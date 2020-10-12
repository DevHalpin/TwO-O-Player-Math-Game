class Game
  def initialize(name)
    @name = name
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
  end

  def start
    puts("A new game has been started. Welcome #{@player1.name} and #{@player2.name}")
    turn
  end

  def show_stats
    puts("P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3")
  end

  def new_question(player)
    ask_question = Question.new
    ask_question.print_question(player.name)
    print("> ")
    @choice = gets.chomp
    if ask_question.check_response(@choice.to_i)
      puts("#{player.name}: YES! You are correct.")
    else
      puts("#{player.name}: Seriously? No!")
      player.lose_life
    end
    check_score
    show_stats
  end

  def turn
    while @player1.lives > 0 || @player2.lives > 0 do
      new_question(@player1)
      new_question(@player2)
      puts ("----- NEW TURN -----")
    end
  end

  def winner(player)
    puts("#{player.name} wins with a score of #{player.lives}/3")
    puts("----- GAME OVER -----")
    puts("Good bye!")
    exit(0)
  end

  def check_score
    if @player1.is_dead
        winner(@player2)
    elsif @player2.is_dead
        winner(@player1)
    end
  end
end
        
require_relative "hang_boards"
require_relative "word_gen"

class GameManager

  include Board
  include WordGenerator
  
  def new_game()
    @word = generate()
    @guessed = Array.new()
    @all_guesses = Array.new()
    @word_array = @word.split('')
    @word_array.delete_at(-1)
    @guesses = 0
    round()
  end

  def round()
    tier(@guesses)
    all_guesses = @all_guesses.join(", ")
    puts "\nYou have gussesed: #{all_guesses}"
    
    output_string = Array.new()
    @word_array.each do |space|
      if @guessed.include?(space)
        output_string.push(space)
      else
        output_string.push("_")
      end
    end
    puts output_string.join("")

    if(output_string.join("") == @word_array.join(""))
      puts "\nYou Win!"
      replay()
    end

    unless @guesses == 6
      puts "\nChoose a letter to guess"
      guess = gets.chomp()

      if guess.match(/^[[:alpha:]]+$/) && guess.length == 1
        if @all_guesses.include?(guess)
          puts "\nYou already guessed \"#{guess}\""
          round()
        end
      else
        round()
      end
    
      if @word_array.include?(guess)
        puts "#{guess} is in the word!"
        @guessed.push(guess)
        @all_guesses.push(guess)
        round()
      else
        puts "#{guess} is not in the word"
        @all_guesses.push(guess)
        @guesses += 1
        round()
      end
    end

    if(@guesses == 6)
      puts "\nYou lost! 
            \nThe word was #{@word}"
      replay()
    end
  end

  def replay()
    puts "\nPlay again? Type \"1\" to play again, type \"2\" to exit"
    var = gets.chomp()
    if var == "1"
      game = GameManager.new.new_game()
    elsif var == "2"
      exit
    else
      replay()
    end
  end
end
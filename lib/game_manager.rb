require_relative "hang_boards"
require_relative "word_gen"
require_relative "save_load"
require 'yaml'

class GameManager

  include Save
  include Load
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

  def load_game(word, guesses, all_guesses)
    @word = word
    @guessed = Array.new()
    @all_guesses = all_guesses
    @word_array = @word.split('')
    @guesses = guesses.to_i
    @all_guesses.each do |char|
      if @word_array.include?(char)
        @guessed.push(char)
      end
    end
    round()
  end

  def round()   
    tier(@guesses)
    all_guesses = @all_guesses.join(", ")
    puts "\nYou have gussesed: #{all_guesses}"
    if @guesses == 1
      puts "\nYou have #{@guesses}/6 mistake"
    else
      puts "\nYou have #{@guesses}/6 mistakes"
    end
    
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
      puts "\nChoose a letter to guess, or type \"1\" to save the game for later"
      guess = gets.chomp()
      guess = guess.downcase()

      if(guess == "1")
        total_guesses = @guesses
        word = @word_array.join('')
        all_guessed = @all_guesses.join(", ")

        var = save_game(word, total_guesses, all_guessed)
        if var == 1
          puts "\nGame Saved"
          round()
        else
          round()
        end
      end
      
      if guess.match(/^[[:alpha:]]+$/) && guess.length == 1
        if @all_guesses.include?(guess)
          puts "\nYou already guessed \"#{guess}\""
          round()
        end
      else
        round()
      end
    
      if @word_array.include?(guess)
        puts "\n\"#{guess}\" is in the word!"
        @guessed.push(guess)
        @all_guesses.push(guess)
        round()
      else
        puts "\n\"#{guess}\" is not in the word"
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
    puts "\nPlay again? Type \"1\" to play again, type \"2\" to load a previous save, type \"3\" to exit"
    var = gets.chomp()
    if var == "1"
      game = GameManager.new.new_game()
    elsif var == "2"
      data = load_game_save()
      unless data == 0
        word = data[1]
        guesses = data[0]
        all_guesses = data[2].split(", ")
        game = GameManager.new.load_game(word, guesses, all_guesses)
      else
        puts "No saved game found"
        replay()
      end
    elsif var == "3"
      exit
    else
      replay()
    end
  end
end
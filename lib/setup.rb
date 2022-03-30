require_relative "game_manager"
require "yaml"

include Load

def setup()
  puts "\nType \"1\" for New Game, type \"2\" to load current game"
  detect = gets.chomp()
  if detect == "1"
    game = GameManager.new.new_game()
  elsif detect == "2"
    data = load_game_save()
    unless data == 0
      word = data[1]
      guesses = data[0]
      all_guesses = data[2].split(", ")
      game = GameManager.new.load_game(word, guesses, all_guesses)
    else
      puts "No saved game found"
    end
  else
    setup()
  end
end
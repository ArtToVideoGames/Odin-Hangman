require_relative "game_manager"
require "yaml"

def setup()
  puts "\nType \"1\" for New Game, type \"2\" to load current game"
  detect = gets.chomp()
  if detect == "1"
    game = GameManager.new.new_game()
  elsif detect == "2"
    fname = "data.yaml"
    if File.exists?(fname)
      word = ""
      guesses = 0
      all_guesses = Array.new()

      data = YAML.load(File.read(fname))
      word = data[1].to_s
      guesses = data[0].to_i
      all_guesses = data[2].to_s.split(", ")

      game = GameManager.new.load_game(word, guesses, all_guesses)
      
    else
      puts "No saved data found"
      setup()
    end
  else
    setup()
  end
end
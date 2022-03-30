require_relative "game_manager"

def setup()
  puts "\nType \"1\" for New Game"
  detect = gets.chomp()
  if detect == "1"
    game = GameManager.new.new_game()
  else
    setup()
  end
end
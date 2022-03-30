require_relative "lib/setup"

puts "Welcome to Hangman!
\nHow to play:
\nWhen the game begins, the computer will choose a random word
\nAnd your job will be to guess what it before you run out of mistakes!
\nYou can only make guesses using single letters though and the game will tell you where that letter is and how many times it shows up.
\nIf your letter doesn't show up, you have made a mistake and another body part will be added to the hangman!
\nYou have 6 mistakes per game to guess the word!
\nIf you guess the word before you run out of guesses, you win!"
setup()
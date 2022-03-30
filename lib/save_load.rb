require 'yaml'

module Save
  def save_game(word, total_guesses, all_guessed)
    data = [total_guesses, word, all_guessed]

    fname = "data.yaml"

    if(File.exists?(fname))
      puts "\nWarning: This will overwrite your previous save. Type \"1\" to continue."
      var = gets.chomp()
      if var == "1"
        File.open(fname, "w") {|file| file.write(data.to_yaml)}
        return 1
      else
        return 0
      end
    else
      File.open(fname, "w") {|file| file.write(data.to_yaml)}
      return 1
    end
  end
end

module Load
  def load_game_save()
    fname = "data.yaml"
    if File.exists?(fname)
      word = ""
      guesses = 0
      all_guesses = Array.new()

      data = YAML.load(File.read(fname))
      return data 
    else
      return 0
      setup()
    end
  end
end
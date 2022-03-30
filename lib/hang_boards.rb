module Board
  
  def tier(level)
    if level == 0
      puts " ┌ ——————— ┐
          \n           |
          \n           |
          \n           |
          \n           |
          \n           |
          \n           ┴"
    elsif level == 1
      puts " ┌ ——————— ┐
          \n O         |
          \n           |
          \n           |
          \n           |
          \n           |
          \n           ┴"
      elsif level == 2
      puts " ┌ ——————— ┐
          \n O         |
          \n |         |
          \n           |
          \n           |
          \n           |
          \n           ┴"
      elsif level == 3
      puts " ┌ ——————— ┐
          \n O         |
          \n\\|         |
          \n           |
          \n           |
          \n           |
          \n           ┴"
      elsif level == 4
      puts " ┌ ——————— ┐
          \n O         |
          \n\\|/        |
          \n           |
          \n           |
          \n           |
          \n           ┴"
      elsif level == 5
      puts " ┌ ——————— ┐
          \n O         |
          \n\\|/        |
          \n \\         |
          \n           |
          \n           |
          \n           ┴"
      elsif level == 6
      puts " ┌ ——————— ┐
          \n O         |
          \n\\|/        |
          \n/\\         |
          \n           |
          \n           |
          \n           ┴"
    end
  end
end
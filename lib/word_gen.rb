module WordGenerator
  def generate()
    lines = File.readlines('words.txt')
    r = Random.rand(1..9894)
    lines.each_with_index do |line, i|
      if i == r
        return line
      end
    end
  end
end
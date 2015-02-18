class EscapeReader
  def initialize
    @colors = {
      "k" => "\033[40m", #Black
      "r" => "\033[41m", #Red
      "g" => "\033[42m", #Green
      "y" => "\033[43m", #Yellow
      "b" => "\033[44m", #Blue
      "m" => "\033[45m", #Magenta
      "c" => "\033[46m", #Cyan
      "e" => "\033[47m", #Green
    }
  end

  #Returns a line full of escape sequences
  def parse_colors(s)

    line = ""

    s.each_char do |c|
      line.concat(@colors[c]) if @colors.has_key?(c)
      line.concat(" ")
    end

    line.concat("\033[0m")
  end

  def test_run()
    puts(parse_colors("krgybmce"))
  end

  def parse_color_file(file_name)
    IO.foreach(file_name) do |line|
      puts(parse_colors(line.chomp("\n")))
    end
  end
end

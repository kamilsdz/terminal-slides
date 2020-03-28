require "io/console"

class Controller
  def initialize(reader)
    @reader = reader
    @current_page = 1
  end

  def execute
    print_current_page
    catch_keys
  end

  private

  attr_reader :reader, :current_page

  def catch_keys
    while true
      input = $stdin.getch
      case input
      when "q" || "27"
        exit
      when "D"
        if current_page != 1
          @current_page -= 1
          print_current_page
        end
      when "C"
        if reader.slides.keys.max != current_page
          @current_page += 1
          print_current_page
        end
      end
    end
  end

  def print_current_page
    system("clear")
    reader.read(current_page) { |line| reader.printer.puts(line) }
  end
end

require_relative "controller"
require_relative "printer"
require_relative "slide_reader"
require_relative "slide_loader"

begin
system("tput civis")
slides = SlideLoader.new("np.slide").load
printer = Printer.new
reader = SlideReader.new(printer, slides)
controller = Controller.new(reader).execute
ensure
  system("tput cnorm")
end

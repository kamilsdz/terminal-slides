module TerminalSlides
  class Run
    def self.now(presentation_name)
      begin
        system("tput civis")
        slides = SlideLoader.new(presentation_name).load
        printer = Printer.new
        reader = SlideReader.new(printer, slides)
        controller = Controller.new(reader).execute
      ensure
        system("tput cnorm")
      end
    end
  end
end

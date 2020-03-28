Gem::Specification.new do |s|
  s.name = "terminal_slides"
  s.version = "0.0.1"
  s.authors = ["Kamil Sopata"]
  s.date = "2020-03-28"
  s.summary = "Simple presentations in terminal"
  s.files = [
    "lib/terminal_slides.rb",
    "lib/terminal_slides/controller.rb",
    "lib/terminal_slides/printer.rb",
    "lib/terminal_slides/run.rb",
    "lib/terminal_slides/slide_loader.rb",
    "lib/terminal_slides/slide_reader.rb",
  ]
  s.require_paths = ["lib"]
  s.bindir = "exe"
  s.executables << "terminal_slides"
end

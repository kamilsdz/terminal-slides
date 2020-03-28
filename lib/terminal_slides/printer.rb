require "artii"
require "base64"

module TerminalSlides
  class Printer
    DEFAULT_ASCII_ART = "starwars".freeze

    FONTS = {
      standard: 0,
      bold: 1,
      italic: 3,
      underline: 4,
      blink: 5,
      reverse: 6
    }.freeze

    COLORS = {
      red: 31,
      green: 32,
      brown: 33,
      blue: 34,
      magenta: 35,
      cyan: 36,
      gray: 37
    }.freeze

    BG_COLORS = {
      bg_red: 41,
      bg_gren: 42,
      bg_brown: 43,
      bg_blue: 44,
      bg_magenta: 45,
      bg_cyan: 46,
      bg_gray: 47
    }.freeze

    MAPPING = {
      **FONTS,
      **COLORS,
      **BG_COLORS
    }.freeze

    def set_font(font)
      @font = font
    end

    def set_image(path)
      Kernel.puts "\033]1337;File=inline=1:#{Base64.strict_encode64(File.open(path).read)}\a"
    end

    def set_ascii_art(string)
      print Artii::Base.new(font: DEFAULT_ASCII_ART).asciify(string)
    end

    def puts(string)
      color = font || :standard
      code = MAPPING[color.to_sym] || MAPPING[:standard]
      Kernel.puts("\e[#{code}m#{string}")
    end

    private

    attr_reader :font
  end
end

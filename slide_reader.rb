class SlideReader
  def initialize(printer, slides)
    @printer = printer
    @slides = slides
  end

  def read(page)
    content(page).each do |line|
      parse(line)
      yield(line)
    end
  end

  def parse(line)
    raw_tokens = line.scan(/{{.*}}/).flatten
    tokens = raw_tokens.map { |str_token| tokenize(str_token) }
    apply_tokens(tokens)

    raw_tokens.each { |raw_token| line.gsub!(raw_token, "") }
  end

  def tokenize(str_token)
    key, value = str_token.gsub(/{{|}}/, "").sub(" ", "").split(":")
  end

  def apply_tokens(tokens)
    tokens.each do |key, value|
      if printer.respond_to?("set_#{key}")
        printer.send("set_#{key}", value)
      end
    end
  end

  attr_reader :printer, :slides

  private

  def content(page)
    slides[page].map{|el| el.dup}
  end
end

module TerminalSlides
  class SlideLoader
    def initialize(file_path)
      @file_path = file_path
      @file_lines = { 1 => [] }
    end

    def load
      current_page = 1
      file = File.open(file_path).each do |line|
        if separator?(line)
          current_page += 1
          file_lines[current_page] = []
        else
          file_lines[current_page] << line
        end
      end

      file_lines
    end

    private

    attr_reader :file_path, :file_lines

    def separator?(line)
      line.match?(/^---/)
    end
  end
end

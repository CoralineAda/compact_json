require "simplecov"

module SimpleCov::Formatter::CompactJSON

  def self.new
    ::CompactJSON::Formatter.new
  end

end

module CompactJSON
  class Formatter

    attr_reader :result

    def format(result)
      @result = result
      File.open("./coverage/results.json", "w") do |file|
        file.print(parsed_result)
      end
    end

    def parsed_result
      {
        summary: parsed_summary,
        files: parsed_files
      }.to_json
    end

    private

    def parsed_files
      self.result.files.map do |file|
        {
          filename: file.filename,
          coverage: file.covered_percent.round(2)
        }
      end
    end

    def parsed_summary
      {
        coverage: result.covered_percent.round(2),
      }
    end

  end
end

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
      File.open(destination_file, "w") do |file|
        file.print(formatted_result)
      end
    end

    def formatted_result
      {
        summary: summary_results,
        files: file_results
      }.to_json
    end

    private

    def destination_file
      File.join(SimpleCov.coverage_dir, "results.json")
    end

    def file_results
      self.result.files.map do |file|
        {
          filename: file.filename,
          coverage: file.covered_percent.round(2)
        }
      end
    end

    def summary_results
      {
        coverage: result.covered_percent.round(2),
      }
    end

  end
end

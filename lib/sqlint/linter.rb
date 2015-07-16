require 'pg_query'

module SQLint
  class Linter
    Lint = Struct.new(:filename, :line, :column, :type, :message)

    def initialize(filename, input_stream)
      @input = input_stream.read
      @filename = filename
    end

    def run
      [].tap do |results|
        begin
          PgQuery.parse(@input)
        rescue PgQuery::ParseError => e
          offset = e.location
          lines_before_error = @input[0...(offset)].split("\n")
          line_number = lines_before_error.size
          column_number = lines_before_error.any? ? lines_before_error.last.size : 1
          results << Lint.new(@filename, line_number, column_number, :error, e.message)
        end
      end
    end
  end
end

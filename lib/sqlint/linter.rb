require 'pg_query'

module SQLint
  class Linter
    Lint = Struct.new(:filename, :line, :column, :type, :message)
    ParseState = Struct.new(:input, :offset)
    END_PARSE = ParseState.new(nil, nil)

    def initialize(filename, input_stream)
      @input = input_stream.read
      @filename = filename
    end

    def run
      [].tap do |results|
        state = ParseState.new(@input, 0)
        while state != END_PARSE
          error, new_parse_state = parse_next_error(state)
          results << error if error
          state = new_parse_state
        end
      end
    end

    private

    def parse_next_error(parse_state)
      begin
        PgQuery.parse(parse_state.input)
        [nil, END_PARSE]
      rescue PgQuery::ParseError => e
        offset = e.location + parse_state.offset
        line_number, column_number = find_absolute_position(offset)
        lint = Lint.new(@filename, line_number, column_number, :error, e.message)

        input_from_error = parse_state.input[e.location..-1]
        semicolon_pos = input_from_error.index(";")
        [
          lint,
          if semicolon_pos
            remaining_input = input_from_error[semicolon_pos+1..-1]
            new_offset = offset + semicolon_pos + 1
            ParseState.new(remaining_input, new_offset)
          else
            END_PARSE
          end
        ]
      end
    end

    def find_absolute_position(offset)
      lines_before_error = @input[0...(offset)].split("\n")
      line_number = lines_before_error.size
      column_number = lines_before_error.any? ? lines_before_error.last.size : 1
      [line_number, column_number]
    end
  end
end

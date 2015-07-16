require_relative '../lib/sqlint'

RSpec.describe SQLint do
  WIBBLE_ERROR = 'syntax error at or near "WIBBLE"'

  let(:filename) { "some/file/here.sql" }
  let(:input) { "SELECT 1" }
  let(:input_stream) { StringIO.new(input) }
  subject(:linter) { SQLint::Linter.new(filename, input_stream) }
  let(:results) { linter.run }

  def error(line, col, msg)
    SQLint::Linter::Lint.new(filename, line, col, :error, msg)
  end

  def warning(line, col, msg)
    SQLint::Linter::Lint.new(filename, line, col, :warning, msg)
  end

  context "with empty input" do
    let(:input) { "" }

    it "reports no errors" do
      expect(results).to be_empty
    end
  end

  describe "single errors" do
    context "with a single valid statement" do
      it "reports no errors" do
        expect(results).to be_empty
      end
    end

    context "with a single invalid keyword" do
      let(:input) { "WIBBLE" }
      it "reports one error" do
        expect(results.size).to eq(1)
        expect(results.first).to eq(error(1, 1, WIBBLE_ERROR))
      end
    end

    context "with a single invalid keyword on a later line" do
      let(:input) { "SELECT 1;\nWIBBLE" }
      it "reports one error" do
        expect(results.size).to eq(1)
        expect(results.first).to eq(error(2, 1, WIBBLE_ERROR))
      end
    end

    context "with a single error part-way through a line" do
      let(:input) { "SELECT '" }
      it "reports one error" do
        expect(results.size).to eq(1)
        expect(results.first).to eq(error(1, 8, 'unterminated quoted string at or near "\'"'))
      end
    end

    context "when there are 2 errors in separate statements" do
      let(:input) { "WIBBLE; WIBBLE" }
      it "report 2 errors" do
        expect(results).to eq([error(1, 1, WIBBLE_ERROR), error(1, 9, WIBBLE_ERROR)])
      end
    end

    context "when there is a second error at the end of the file" do
      let(:input) { "WIBBLE; SELECT 1 FROM" }
      it "report 2 errors" do
        expect(results).to eq([error(1, 1, WIBBLE_ERROR),
                               error(1, 21, "syntax error at end of input")])
      end
    end
  end
end

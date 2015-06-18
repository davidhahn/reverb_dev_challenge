require 'minitest/autorun'
require 'parser'

class ParserTest < Minitest::Test
  def setup
    @files = ["pipe", "comma", "space"]
  end

  def test_files_return_correct_number_of_fields
    # Will choose a random file
    file_name = @files.shuffle.first

    file = File.open("data/#{file_name}.txt").each_line do |line|
      # Each dummy data file has 6 lines
      assert_equal 5, Parser.parse(line).length
    end
    file.close
  end

  def test_raise_an_error_if_input_is_nil
    assert_raises(ArgumentError) { Parser.parse() }
  end

  def test_raise_an_error_if_there_are_less_than_5_elements_in_a_line
    file = File.open("data/bad_data.txt").each do |line|
      assert_raises(RuntimeError) { Parser.parse(line) }
    end
    file.close
  end
end
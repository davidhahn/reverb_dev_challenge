require 'minitest/autorun'
require 'rack/test'
require 'parser'
require 'record'
require 'json'

class GrapeTest < MiniTest::Test
  include Rack::Test::Methods

  def setup
    @record1 = Record.new("Jobs", "Steve", "Male", "Space Gray", "02/24/1955").to_json
    @record2 = Record.new("Gates", "Bill", "Male", "Blue", "10/28/1955").to_json
    @record3 = Record.new("Mayer", "Marissa", "Female", "Red", "05/30/1975").to_json
    @record4 = Record.new("Sandberg", "Sheryl", "Female", "Yellow", "08/28/1969").to_json

    @random = [@record1, @record2, @record3, @record4].shuffle.first
  end

  def teardown
    Record.destroy_all!
  end

  def app
    Record::API
  end

  def test_post_records_posts_a_data_to_our_code
    test_entry = "Musk, Elon, Male, Orange, 06/28/1971"
    post "/records", { record: test_entry }
    assert(last_response.status, 302)
  end

  def test_get_records_gender_returns_an_array_sorted_by_gender
    get "/records/gender"
    assert(last_response.ok?)
    assert_equal([@record3, @record4, @record2, @record1], JSON.parse(last_response.body))
  end

  def test_get_records_birthdate_returns_an_array_sorted_by_birthdate
    get "/records/birthdate"
    assert(last_response.ok?)
    assert_equal([@record1, @record2, @record4, @record3], JSON.parse(last_response.body))
  end

  def test_get_records_name_returns_an_array_sorted_by_name
    get "/records/name"
    assert(last_response.ok?)
    assert_equal([@record4, @record3, @record1, @record2], JSON.parse(last_response.body))
  end
end
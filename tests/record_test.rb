require 'minitest/autorun'
require 'record'

class RecordTest < Minitest::Test
  def setup
    @record1 = Record.new("Jobs", "Steve", "Male", "Space Gray", "02/24/1955")
    @record2 = Record.new("Gates", "Bill", "Male", "Blue", "10/28/1955")
    @record3 = Record.new("Mayer", "Marissa", "Female", "Red", "05/30/1975")
    @record4 = Record.new("Sandberg", "Sheryl", "Female", "Yellow", "08/28/1969")

    @random = [@record1, @record2, @record3, @record4].shuffle.first
  end

  def teardown
    Record.destroy_all!
  end

  def test_record_responds_to_attributes_and_not_nil
    [:last_name, :first_name, :gender, :favorite_color, :birthday].each do |attribute|
      assert_respond_to(@random, attribute)
      refute_nil(@random.send(attribute), "#{attribute.to_s.capitalize} is empty!")
    end
  end

  def test_birthday_is_in_date_format
    assert_equal(Date, @random.birthday.class)
  end

  def test_retrieve_all_people
    assert_respond_to(Record, :all)
    assert_equal(4, Record.all.length)
  end

  def test_sort_by_gender_then_last_name
    assert_equal([@record3, @record4, @record2, @record1], Record.sort_by_gender)
  end

  def test_sort_by_birthday
    assert_equal([@record1, @record2, @record4, @record3], Record.sort_by_birthday)
  end

  def test_sort_by_last_name
    assert_equal([@record4, @record3, @record1, @record2], Record.sort_by_last_name)
  end
end
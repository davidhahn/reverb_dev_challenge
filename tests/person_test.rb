require 'minitest/autorun'
require 'person'

class PersonTest < Minitest::Test
  def setup
    @person1 = Person.new("Jobs", "Steve", "Male", "Space Gray", "02/24/1955")
    @person2 = Person.new("Gates", "Bill", "Male", "Blue", "10/28/1955")
    @person3 = Person.new("Mayer", "Marissa", "Female", "Red", "05/30/1975")
    @person4 = Person.new("Sandberg", "Sheryl", "Female", "Yellow", "08/28/1969")

    @random = [@person1, @person2, @person3, @person4].shuffle.first
  end

  def teardown
    Person.destroy_all!
  end

  def test_person_responds_to_attributes_and_not_nil
    [:last_name, :first_name, :gender, :favorite_color, :birthday].each do |attribute|
      assert_respond_to(@random, attribute)
      refute_nil(@random.send(attribute), "#{attribute.to_s.capitalize} is empty!")
    end
  end

  def test_birthday_is_in_date_format
    assert_equal(Date, @random.birthday.class)
  end

  def test_retrieve_all_people
    assert_respond_to(Person, :all)
    assert_equal(4, Person.all.length)
  end

  def test_sort_by_gender_then_last_name
    assert_equal([@person3, @person4, @person2, @person1], Person.sort_by_gender)
  end

  def test_sort_by_birthday
    assert_equal([@person1, @person2, @person4, @person3], Person.sort_by_birthday)
  end

  def test_sort_by_last_name
    assert_equal([@person4, @person3, @person1, @person2], Person.sort_by_last_name)
  end
end
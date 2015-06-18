require 'date' # for parsing the date

class Person
  attr_accessor :first_name, :last_name, :gender, :favorite_color, :birthday
  @@people = []
  def initialize(last_name, first_name, gender, favorite_color, birthday)
    @last_name = last_name
    @first_name = first_name
    @gender = gender
    @favorite_color = favorite_color
    @birthday = Date.strptime(birthday, "%m/%d/%Y")

    @@people << self
  end

  def self.destroy_all!
    @@people = []
  end

  def self.all
    @@people
  end

  def self.sort_by_gender
    # sorted by gender (females before males) then by last name ascending.
    @@people.sort_by { |person| [person.gender, person.last_name]}
  end

  def self.sort_by_birthday
    # sorted by birth date, ascending.
    @@people.sort_by(&:birthday)
  end

  def self.sort_by_last_name
    # sorted by last name, descending.
    @@people.sort { |person1, person2| person2.last_name <=> person1.last_name }
  end

  def to_s
    "#{@last_name}, #{@first_name}(#{@gender}) was born on #{@birthday.strftime("%m/%d/%Y")} and likes the color #{@favorite_color}."
  end
end
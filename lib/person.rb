class Person
  PEOPLE = []
  def initialize(last_name, first_name, gender, favorite_color, birthday)
    @last_name = last_name
    @first_name = first_name
    @gender = gender
    @favorite_color = favorite_color
    @birthday = birthday

    PEOPLE << self
  end

  def self.all

  end

  def self.sort_by_gender

  end

  def self.sort_by_birthday

  end

  def self.sort_by_last_name

  end
end
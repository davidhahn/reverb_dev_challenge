require 'date' # for parsing the date
require 'grape'
require 'json'
require 'parser'
class Record
  attr_accessor :first_name, :last_name, :gender, :favorite_color, :birthday

  @@records = []

  class API < Grape::API
    default_format :json
    namespace :records do
      params do
        optional :record
      end

      get 'gender' do
        Record.sort_by_gender.map{ |r| r.to_json }
      end

      get 'birthdate' do
        Record.sort_by_birthday.map{ |r| r.to_json }
      end

      get 'name' do
        Record.sort_by_last_name.map{ |r| r.to_json }
      end

      post do
        record = Parser.parse(params[:record])
        Record.new(*record).to_json
      end
    end
  end

  def initialize(last_name, first_name, gender, favorite_color, birthday)
    @last_name = last_name
    @first_name = first_name
    @gender = gender
    @favorite_color = favorite_color
    @birthday = Date.strptime(birthday, "%m/%d/%Y")

    @@records << self
  end

  def self.destroy_all!
    @@records = []
  end

  def self.all
    @@records
  end

  def self.sort_by_gender
    # sorted by gender (females before males) then by last name ascending.
    @@records.sort_by { |person| [person.gender, person.last_name]}
  end

  def self.sort_by_birthday
    # sorted by birth date, ascending.
    @@records.sort_by(&:birthday)
  end

  def self.sort_by_last_name
    # sorted by last name, descending.
    @@records.sort { |person1, person2| person2.last_name <=> person1.last_name }
  end

  def to_s
    "#{@last_name}, #{@first_name}(#{@gender}) was born on #{@birthday.strftime("%m/%d/%Y")} and likes the color #{@favorite_color}."
  end

  def to_json
    { "last_name" => self.last_name, "first_name" => self.first_name, "gender" => self.gender, "favorite_color" => self.favorite_color, "birthday" => self.birthday.strftime("%m/%d/%Y") }.to_json
  end
end
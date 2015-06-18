require_relative 'person'
require_relative 'parser'

File.open(ARGV[0], "r").each_line do |line|
  person = Parser.parse(line)
  Person.new(*person)
end

puts "Sorted by gender then last name(ascending)"
puts "------------------------------------------"
puts Person.sort_by_gender
puts ""
puts ""
puts "Sorted by birthday(ascending)"
puts "------------------------------------------"
puts Person.sort_by_birthday
puts ""
puts ""
puts "Sorted by last_name(descending)"
puts "------------------------------------------"
puts Person.sort_by_last_name
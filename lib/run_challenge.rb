require_relative 'record'
require_relative 'parser'

File.open(ARGV[0], "r").each_line do |line|
  person = Parser.parse(line)
  Record.new(*person)
end

puts "Sorted by gender then last name(ascending)"
puts "------------------------------------------"
puts Record.sort_by_gender
puts ""
puts ""
puts "Sorted by birthday(ascending)"
puts "------------------------------------------"
puts Record.sort_by_birthday
puts ""
puts ""
puts "Sorted by last_name(descending)"
puts "------------------------------------------"
puts Record.sort_by_last_name
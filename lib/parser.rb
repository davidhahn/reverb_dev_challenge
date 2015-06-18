require_relative 'record'

module Parser
  def self.parse(text)
    # turn the line into an array by spliting at | , and any blank spaces
    array = text.split(/[|, \p{Space}]/)
    # remove any empty string elements
    array.reject! { |a| a == "" }
    raise RuntimeError if array.length != 5
    return array
  end
end
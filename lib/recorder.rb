require_relative 'parser'
require_relative 'record'
require 'json'

class Recorder
  def call(env)
    request = Rack::Request.new(env)

    case request.path
    when "/" then Rack::Response.new(Record.sort_by_gender)
    when "/records"
      Rack::Response.new do |response|
        record = Parser.parse(request.params["record"])
        new_record = Record.new(*record)
        Rack::Response.new(Record.sort_by_gender)
        response.redirect("/records/gender", status = 302)
      end
    when "/records/gender" then Rack::Response.new(Record.sort_by_gender)
    when "/records/birthdate" then Rack::Response.new(Record.sort_by_birthday)
    when "/records/name" then Rack::Response.new(Record.sort_by_last_name)
    else
      Rack::Response.new("Not a valid path", 404)
    end
  end
end
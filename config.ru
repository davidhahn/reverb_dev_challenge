require 'recorder'

use Rack::Reloader, 0

run Recorder.new
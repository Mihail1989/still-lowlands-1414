require_relative 'app/root'

use Rack::Reloader

map '/' do
  run App::Root.new
end
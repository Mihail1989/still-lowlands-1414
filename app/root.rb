require_relative '../lib/running_rack'
module App
  class Root
    def call env
      @req = Rack::Request.new env
      if @req.GET['clean'] == 'yes'
        RunningRack.drop_cache!
      end

      cache = RunningRack.cache.empty? ? 'Используем веб...' : 'Используем кеш...'
      @res = Rack::Response.new

      @res.write '<title>Lobstericious!</title>'
      @res.write "<p>#{cache}</p>"
      @res.write "<p><a href='?clean=yes'>crash!</a></p>"
      @res.write '<pre>'
      @res.write "#{RunningRack.print}"
      @res.write '</pre>'
      @res.finish
    end
  end
end
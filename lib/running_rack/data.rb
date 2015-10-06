require 'open-uri'
module RunningRack
  module Data
    DATA_URL = 'http://api.data.mos.ru/v1/datasets/899/rows'

    def self.import
      encode_query = URI.encode DATA_URL
      open URI.parse encode_query
    rescue Errno::ETIMEDOUT, SocketError
      puts 'Please, check your network connect!'
    end
  end
end
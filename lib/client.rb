require './lib/request.rb'
require './lib/connection.rb'
require './lib/error.rb'
module Pwinty
  class Client

    def initialize(merchantId,apiKey)
      @merchantId = merchantId
      @apiKey = apiKey
      @target_url = 'https://sandbox.pwinty.com'
    end

    def GetOrders
      begin
        response = request(:get,'https://sandbox.pwinty.com/Orders',{})
        puts response.inspect
#      rescue
#       puts 'error doing get'
      end
    end
    include Connection
    include Request
    
  end
end

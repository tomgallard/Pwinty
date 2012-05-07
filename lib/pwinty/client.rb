require 'pwinty/request.rb'
require 'pwinty/connection.rb'
require 'pwinty/error.rb'
module Pwinty
  class Client

    def initialize(merchantId,apiKey)
      @merchantId = merchantId
      @apiKey = apiKey
      @target_url = 'https://sandbox.pwinty.com'
    end

    def get_orders
      begin
        response = request(:get,'https://sandbox.pwinty.com/Orders',{})
        response
      end
    end
    def get_order(id)
      response = request(:get,'https://sandbox.pwinty.com/Orders',
          { 'query' => { 'id' => id } })
    end
    include Connection
    include Request
    
  end
end

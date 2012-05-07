module Pwinty
  class Client
    module Request
      def request(action,path,options)
        headers = { 'X-Pwinty-MerchantId'=> @merchantId,
                    'X-Pwinty-REST-API-Key' => @apiKey }
        headers.merge!(options[:headers]) if options[:headers]
        response = connection.send(action,path) do |request|
          request.body = options[:body] if options[:body]
          request.headers = headers unless headers.empty?
          request.url('',options[:query]) if options[:query]
        end
        response.body
      end
    end
  end
end

require 'faraday_middleware'
require 'faraday'
require 'pwinty/raise_http_exception'
module Pwinty
  class Client
    module Connection
      private

      def connection
        connection = Faraday.new(:url => @target_url) do |builder|
          builder.use FaradayMiddleware::EncodeJson
          builder.use FaradayMiddleware::ParseJson
          builder.use Faraday::Response::Logger
          builder.use FaradayMiddleware::Instrumentation
          builder.use FaradayMiddleware::RaiseHttpException
          builder.adapter Faraday.default_adapter
        end
      end
    end
  end
end

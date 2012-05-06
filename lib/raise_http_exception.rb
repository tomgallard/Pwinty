require 'faraday'

module FaradayMiddleware
  class RaiseHttpException < Faraday::Middleware
    def call(env)
      @app.call(env).on_complete do |response|
        case response[:status].to_i
          when 400
            raise Pwinty::BadRequest,response
          when 401
            raise Pwinty::NotAuthorized,response
        end
      end
    end
  end
end

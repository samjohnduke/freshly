require 'faraday'
require 'freshly/error'

module Freshly
  # Faraday response middleware
  module Response

    # This class raises an exception based
    # HTTP status codes returned by the API
    class RaiseError < Faraday::Response::Middleware

      private

      def on_complete(response)
        if error = Freshly::Error.from_response(response)
          raise error
        end
      end
    end

  end
end

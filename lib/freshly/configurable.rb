module Freshly
  module Configurable
    attr_accessor :api_key, :api_endpoint, :media_type,
                  :auto_paginate, :per_page, :user_agent,
                  :connection_options, :middleware

    class << self
      def keys
        @keys ||= [
          :api_key,
          :api_endpoint,
          :auto_paginate,
          :connection_options,
          :media_type,
          :per_page,
          :user_agent,
          :middleware
        ]
      end
    end

    def configure
      yield self
    end

    def api_endpoint
      File.join(@api_endpoint, "api/v2")
    end
  end
end

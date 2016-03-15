require 'faraday'
require 'faraday_middleware'
require 'freshly/response/raise_error'

module Freshly
  module Default

    # Default User Agent header string
    USER_AGENT   = "Freshly #{Freshly::VERSION}".freeze

    # Default media type
    MEDIA_TYPE   = "application/json".freeze

    # In Faraday 0.9, Faraday::Builder was renamed to Faraday::RackBuilder
    RACK_BUILDER_CLASS = defined?(Faraday::RackBuilder) ? Faraday::RackBuilder : Faraday::Builder

    # Default Faraday middleware stack
    MIDDLEWARE = RACK_BUILDER_CLASS.new do |builder|
      builder.use Freshly::Response::RaiseError
      builder.request :json
      builder.response :json, :content_type => /\bjson$/
      builder.adapter Faraday.default_adapter
    end

    PER_PAGE = 100

    AUTO_PAGINATE = false

    class << self

      def api_key
        ENV["FRESHLY_API_KEY"]
      end

      def api_endpoint
        ENV["FRESHLY_API_ENDPOINT"]
      end

      def auto_paginate
        AUTO_PAGINATE
      end

      def connection_options
        {
          :headers => {
            :accept => media_type,
            :user_agent => user_agent
          }
        }
      end

      def media_type
        MEDIA_TYPE
      end

      def user_agent
        ENV["FRESHLY_USER_AGENT"] || USER_AGENT
      end

      def middleware
        MIDDLEWARE
      end

      def per_page
        ENV["PER_PAGE"] || PER_PAGE
      end

    end
  end
end

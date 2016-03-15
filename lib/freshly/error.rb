module Freshly
  class Error < StandardError
    attr_reader :response

    def self.from_response response
      status  = response[:status].to_i
      body    = response[:body].to_s
      headers = response[:response_headers]

      if klass =  case status
                  when 400      then Freshly::BadRequest
                  when 401      then Freshly::AuthenticationFailed
                  when 403      then Freshly::AccessDenied
                  when 404      then Freshly::NotFound
                  when 405      then Freshly::MethodNotAllowed
                  when 406      then Freshly::NotAcceptable
                  when 409      then Freshly::Conflict
                  when 415      then Freshly::UnsupportedMediaType
                  when 429      then Freshly::RateLimitExceeded
                  when 400..499 then Freshly::ClientError
                  when 500      then Freshly::InternalServerError
                  when 501      then Freshly::NotImplemented
                  when 502      then Freshly::BadGateway
                  when 503      then Freshly::ServiceUnavailable
                  when 500..599 then Freshly::ServerError
                  end

        klass.new(response)
      end
    end

    def initialize(response=nil)
      @response = response
      super(build_error_message)
    end

    def build_error_message
      "something went wrong"
    end
  end

  class BadRequest < Error; end

  class AuthenticationFailed < Error; end

  class AccessDenied < Error; end

  class NotFound < Error; end

  class MethodNotAllowed < Error; end

  class NotAcceptable < Error; end

  class Conflict < Error; end

  class UnsupportedMediaType < Error; end

  class RateLimitExceeded < Error; end

  class ClientError < Error; end

  class InternalServerError < Error; end

  class NotImplemented < Error; end

  class BadGateway < Error; end

  class ServiceUnavailable < Error; end

  class ServerError < Error; end

end

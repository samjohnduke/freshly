module Freshly
  module Connection
    attr_reader :last_response

    def get url, opts={}
      request :get, url, opts
    end

    def post url, opts={}
      request :post, url, opts
    end

    def put url, opts={}
      request :put, url, opts
    end

    def destroy url, opts={}
      request :delete, url, opts
    end

    def paginate url, opts={}
      get url, opts
    end

  private

    def conn
      @conn ||=  Faraday.new(conn_opts)
    end

    def conn_opts
      conn_opts = connection_options
      conn_opts[:url] = api_endpoint
      conn_opts[:builder] = middleware
      conn_opts[:headers][:Authorization] = "Basic "+Base64.encode64("#{api_key}:X")
      conn_opts
    end

    def request method, url, opts={}
      @last_response = conn.send(method, url, opts)
      @last_response.body
    end

  end
end

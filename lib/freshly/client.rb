require "freshly/connection"
require "freshly/configurable"

require "freshly/ticket"

require "freshly/client/tickets"

module Freshly
  class Client
    include Freshly::Configurable
    include Freshly::Connection
    include Freshly::Client::Tickets

    def initialize opts={}
      Freshly::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", opts[key] || Freshly::Default.send(:"#{key}"))
      end
    end

  end
end

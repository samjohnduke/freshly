require "freshly/connection"
require "freshly/configurable"

require "freshly/ticket"
require "freshly/conversation"

require "freshly/client/tickets"
require "freshly/client/conversations"

module Freshly
  class Client
    include Freshly::Configurable
    include Freshly::Connection
    include Freshly::Client::Tickets
    include Freshly::Client::Conversations

    def initialize opts={}
      Freshly::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", opts[key] || Freshly::Default.send(:"#{key}"))
      end
    end

  end
end

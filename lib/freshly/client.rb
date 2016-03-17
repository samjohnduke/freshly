require "freshly/connection"
require "freshly/configurable"

require "freshly/ticket"
require "freshly/conversation"
require "freshly/contact"

require "freshly/client/tickets"
require "freshly/client/conversations"
require "freshly/client/contacts"
require "freshly/client/agents"

module Freshly
  class Client
    include Freshly::Configurable
    include Freshly::Connection
    include Freshly::Client::Tickets
    include Freshly::Client::Conversations
    include Freshly::Client::Contacts
    include Freshly::Client::Agents
    
    def initialize opts={}
      Freshly::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", opts[key] || Freshly::Default.send(:"#{key}"))
      end
    end

  end
end

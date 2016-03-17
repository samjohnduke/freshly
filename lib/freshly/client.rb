require "freshly/connection"
require "freshly/configurable"

require "freshly/ticket"
require "freshly/conversation"
require "freshly/contact"

require "freshly/client/tickets"
require "freshly/client/conversations"
require "freshly/client/contacts"
require "freshly/client/agents"
require "freshly/client/groups"
require "freshly/client/companies"

module Freshly
  class Client
    include Freshly::Configurable
    include Freshly::Connection
    include Freshly::Client::Tickets
    include Freshly::Client::Conversations
    include Freshly::Client::Contacts
    include Freshly::Client::Agents
    include Freshly::Client::Groups
    include Freshly::Client::Companies

    def initialize opts={}
      Freshly::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", opts[key] || Freshly::Default.send(:"#{key}"))
      end
    end

  end
end

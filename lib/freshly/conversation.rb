module Freshly
  class Conversation
    attr_reader :id

    def initialize id
      @id = id
    end

    def path
      "conversations/#{id}"
    end
  end
end

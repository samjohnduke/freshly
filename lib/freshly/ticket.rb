module Freshly
  class Ticket
    attr_accessor :id

    def initialize id
      @id = id
    end

    def path
      "tickets/#{id}"
    end

  end
end

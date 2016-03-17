module Freshly
  class Contact
    attr_accessor :id

    def initialize id
      @id = id
    end

    def path
      "contacts/#{@id}"
    end
  end
end

module Freshly
  class Client
    module Contacts
      def contacts opts={}
        paginate "contacts", opts
      end

      def contact id, opts={}
        contact = Contact.new(id)
        get "#{contact.path}", opts
      end

      def create_contact opts={}
        post "contacts", opts
      end

      def edit_contact id, opts={}
        contact = Contact.new(id)
        put "#{contact.path}", opts
      end

      def delete_contact id, opts={}
        contact = Contact.new(id)
        destroy "#{contact.path}", opts
      end

      def make_contact_agent id, opts={}
        contact = Contact.new(id)
        put "#{contact.path}/make_agent", opts
      end

      def contact_fields opts={}
        get "contact_fields", opts
      end
    end
  end
end

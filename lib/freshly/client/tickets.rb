module Freshly
  class Client
    module Tickets

      def tickets options={}
        paginate "tickets", options
      end

      def ticket id, options={}
        ticket = Freshly::Ticket.new(id)
        get "#{ticket.path}", options
      end

      def create_ticket options={}
        post "tickets", options
      end

      def edit_ticket id, options={}
        ticket = Ticket.new(id)
        put ticket.path, options
      end

      def delete_ticket id, options={}
        ticket = Ticket.new(id)
        destroy ticket.path, options
      end

      def restore_ticket id, options={}
        ticket = Ticket.new(id)
        put "#{ticket.path}/restore", options
      end

      def ticket_fields options={}
        get "ticket_fields", options
      end

      def ticket_converstaions id, options={}
        ticket = Ticket.new(id)
        paginate "#{ticket.path}/conversations", options
      end

      def ticket_time_entries id, options={}
        ticket = Ticket.new(id)
        paginate "#{ticket.path}/time_entries", options
      end

    end
  end
end

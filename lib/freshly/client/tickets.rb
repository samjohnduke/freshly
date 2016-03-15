module Freshly
  class Client
    module Tickets

      def tickets options={}
        paginate "tickets", options
      end

      def ticket options={}
        get "ticket", options
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

      def reply_to_ticket id, options={}
        ticket = Ticket.new(id)
        post "#{ticket.path}/reply", options
      end

      def ticket_notes id, options={}
        ticket = Ticket.new(id)
        paginate "#{ticket.path}/notes", options
      end

      def ticket_time_entries id, options={}
        ticket = Ticket.new(id)
        paginate "#{ticket.path}/time_entries", options
      end

    end
  end
end

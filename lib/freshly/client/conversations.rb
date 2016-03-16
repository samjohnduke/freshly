module Freshly
  class Client
    module Conversations

      def create_reply ticket_id, opts={}
        ticket = Ticket.new(ticket_id)
        post "#{ticket.path}/reply", opts
      end

      def create_note ticket_id, opts={}
        ticket = Ticket.new(ticket_id)
        post "#{ticket.path}/notes", opts
      end

      def edit_conversation conversation_id, opts={}
        conv = Conversation.new(conversation_id)
        put "#{conv.path}", opts
      end

      def delete_conversation conversation_id, opts={}
        conv = Conversation.new(conversation_id)
        destroy "#{conv.path}", opts
      end

    end
  end
end

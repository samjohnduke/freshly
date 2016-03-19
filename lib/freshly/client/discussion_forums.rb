module Freshly
  class Client
    module DiscussionForums
      def forums category, opts={}
        paginate "dicussions/categories/#{category}/forums"
      end

      def create_forum category, opts={}
        post "discussions/categories/#{category}/forums"
      end

      def forum id, opts={}
        get "dicussions/forums/#{id}", opts
      end

      def edit_forum id, opts={}
        put "discussions/forums/#{id}", opts
      end

      def delete_forum id, opts={}
        destroy "discussions/forums/#{id}", opts
      end

      def monitor_forum id, opts={}
        post "discussions/forums/#{id}/follow"
      end

      def unmonitor_forum id, user_id, opts={}
        opts["user_id"] = user_id
        destroy "discussions/forums/#{id}", opts
      end

      def monitoring_forum? id, user_id, opts={}
        #not implemented yet
      end

    end
  end
end

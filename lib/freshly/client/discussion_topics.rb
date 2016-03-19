module Freshly
  class Client
    module DiscussionTopics
      def topics forum, opts={}
        paginate "discussions/forums/#{form}/topics", opts
      end

      def create_topic forum, opts={}
        post "discussions/forums/#{forum}/topics", opts
      end

      def topic id, opts={}
        get "discussions/topics/#{id}", opts
      end

      def edit_topic id, opts={}
        put "discussions/topics/#{id}", opts
      end

      def delete_topic id, opts={}
        destroy "discussions/topics/#{id}", opts
      end

      def monitor_topic id, opts={}
      end

      def unmonitor_topic id, user_id, opts={}
      end

      def monitoring_topic? id, user_id, opts={}
      end

    end
  end
end

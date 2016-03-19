module Freshly
  class Client
    module DiscussionComments
      def comments topic, opts={}
        paginate "discussions/topics/#{topic}/comments", opts
      end

      def create_comment topic, opts={}
        post "discussions/topics/#{topic}/comments", opts
      end

      def edit_comment id, opts={}
        put "dicussions/comments/#{id}", opts
      end

      def delete_comment id, opts={}
        destroy "dicussions/comments/#{id}", opts
      end
    end
  end
end

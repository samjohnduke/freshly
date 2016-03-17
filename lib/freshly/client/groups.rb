module Freshly
  class Client
    module Groups
      def create_group opts={}
        post "groups", opts
      end

      def group id, opts={}
        get "groups/#{id}", opts
      end

      def groups opts={}
        get "groups", opts
      end

      def edit_group id, opts={}
        put "groups/#{id}", opts
      end

      def delete_group id, opts={}
        destroy "groups/#{id}", opts
      end
    end
  end
end

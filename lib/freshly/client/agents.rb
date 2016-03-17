module Freshly
  class Client
    module Agents
      def agent id, opts={}
        get "agents/#{id}", opts
      end

      def agents opts={}
        paginate "agents", opts
      end

      def me opts={}
        get "agents/me", opts
      end
    end
  end
end

module Freshly
  class Client
    module DiscussionCategories
      def create_category opts={}
        post "discussions/categories"
      end

      def category id, opts={}
        get "discussions/categories/#{id}", opts
      end

      def categories opts={}
        paginate "discussions/categories", opts
      end

      def edit_category id, opts={}
        put "discussions/categories/#{id}", opts
      end

      def delete_category id, opts={}
        destroy "discussions/categories/#{id}", opts
      end
    end
  end
end

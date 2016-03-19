module Freshly
  class Client
    module DiscussionCategories
      def create_category opts={}
        post "dicussions/categories"
      end

      def category id, opts={}
        get "dicussions/categories/#{id}", opts
      end

      def categories opts={}
        paginate "discussions/categories", opts
      end

      def edit_category id, opts={}
        put "dicussions/categories/#{id}", opts
      end

      def delete_category id, opts={}
        destroy "discussions/categories/#{id}", opts
      end
    end
  end
end

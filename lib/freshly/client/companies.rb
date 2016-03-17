module Freshly
  class Client
    module Companies
      def create_company opts={}
        post "companies", opts
      end

      def company id, opts={}
        get "companies/#{id}", opts
      end

      def companies opts={}
        paginate "companies", opts
      end

      def edit_company id, opts={}
        put "companies/#{id}", opts
      end

      def delete_company id, opts={}
        destroy "companies/#{id}"
      end

      def company_fields opts={}
        get "company_fields", opts
      end
    end
  end
end

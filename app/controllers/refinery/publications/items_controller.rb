module Refinery
  module Publications
    class ItemsController < ::ApplicationController

      before_filter :find_page

      def index
        @publications = Item.order('published_at ASC')
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @publication in the line below:
        present(@page)
      end

      def show
        @publication = Item.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @publication in the line below:
        present(@page)
      end

    protected

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/publications").first
      end

    end
  end
end

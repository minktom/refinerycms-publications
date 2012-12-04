module Refinery
  module Publications
    module Admin
      class ItemsController < ::Refinery::AdminController

        crudify :'refinery/publications/item', :xhr_paging => true, :sortable => false

      end
    end
  end
end

module Refinery
  module Publications
    module Admin
      class AuthorsController < ::Refinery::AdminController

        crudify :'refinery/publications/author',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end

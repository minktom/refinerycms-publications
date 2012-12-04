module Refinery
  module Publications
    class Author < Refinery::Core::BaseModel

      attr_accessible :name, :url, :position

      acts_as_indexed :fields => [:name]

      #has_many :author_publications
      #has_many :publications, through: :author_publications
      has_and_belongs_to_many :publications, join_table: 'refinery_publications_author_publications', class_name: 'Item'

      validates :name, :presence => true, :uniqueness => true
    end
  end
end

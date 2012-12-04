module Refinery
  module Publications
    class Item < Refinery::Core::BaseModel
      self.table_name = 'refinery_publications'

      attr_accessible :title, :abstract_url, :published_at, :published_in, :published_url, :published_note,
                      :author_ids, :abstract_id, :position

      acts_as_indexed :fields => [:title, :published_in, :published_note]

      belongs_to :abstract, class_name: '::Refinery::Resource'

      # has_many :author_publications
      # has_many :authors, through: :author_publications
      has_and_belongs_to_many :authors, join_table: 'refinery_publications_author_publications', :foreign_key => 'publication_id'

      validates :title, :presence => true, :uniqueness => true
      validates :published_at, :presence => true

      accepts_nested_attributes_for :authors#, :reject_if => proc {|attributes| attributes[:name].blank? }

      scope :recent, lambda {|num| order('published_at DESC').limit(num||5)}
    end
  end
end

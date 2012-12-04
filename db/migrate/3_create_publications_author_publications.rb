class CreatePublicationsAuthorPublications < ActiveRecord::Migration

  def up
    create_table :refinery_publications_author_publications do |t|
      t.references :author
      t.references :publication
    end

  end

  def down
    drop_table :refinery_publications_author_publications
  end

end

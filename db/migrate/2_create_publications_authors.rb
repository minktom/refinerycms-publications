class CreatePublicationsAuthors < ActiveRecord::Migration

  def up
    create_table :refinery_publications_authors do |t|
      t.string :name
      t.string :url
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-publications"})
    end

    drop_table :refinery_publications_authors

  end

end

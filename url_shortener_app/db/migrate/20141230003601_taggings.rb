class Taggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_topic_id
      t.integer :shortened_url_id
    end

    add_index :taggings, :tag_topic_id
    add_index :taggings, :shortened_url_id
    add_column :shortened_urls, :tag_topic, :string
  end
end

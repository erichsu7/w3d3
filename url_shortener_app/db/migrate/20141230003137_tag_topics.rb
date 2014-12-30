class TagTopics < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.string :name
    end

    add_index :tag_topics, :name, unique: true
  end
end

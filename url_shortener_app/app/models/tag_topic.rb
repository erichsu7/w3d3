class TagTopic < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :name, :inclusion => { :in => %w(news sports entertainment music)}

  has_many(
    :taggings,
    :class_name => 'Tagging',
    :foreign_key => :tag_topic_id,
    :primary_key => :id
  )

  has_many :shortened_urls, :through => :taggings, :source => :shortened_url

  def self.create_topic_from_name(name)
    TagTopic.create! do |t|
      t.name = name
    end
  end

  def find_most_clicked_url
    self.shortened_urls.includes(:shortened_url).order('num_clicks DESC').first
  end

end

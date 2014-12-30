class ShortenedUrl < ActiveRecord::Base
  include SecureRandom

  validates :short_url, presence: true, uniqueness: true

  belongs_to(
    :submitter,
    :class_name => 'User',
    :foreign_key => :submitter_id,
    :primary_key => :id
  )

  has_many(
    :visitors,
    :through => :visits,
    :source => :visitor
  )

  has_many(
    :distinct_visitors,
    -> { distinct },
    :through => :visits,
    :source => :visitor
  )

  has_many :tag_topics, :through => :taggings, :source => :tag_topic

  def self.random_code
    while
      short_url = SecureRandom.urlsafe_base64
      return short_url unless self.exists?(:short_url => short_url)
    end
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create! do |s|
      s.submitter_id = user.id
      s.long_url = long_url
      s.short_url = ShortenedUrl.random_code
    end
  end

  def num_clicks
    self.visitors.count
  end

  def num_uniques
    self.distinct_visitors.count
  end

  def num_recent_uniques
    self.distinct_visitors.where( { created_at: 10.minutes.ago..Time.now } ).count
  end

end

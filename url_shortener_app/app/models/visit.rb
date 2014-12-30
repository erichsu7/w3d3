class Visit < ActiveRecord::Base
  validates :visitor_id, :shortened_url_id, presence: true

  def self.record_visit!(user, shortened_url)
    Visit.create! do |v|
      v.visitor_id = user.id
      v.shortened_url_id = shortened_url.id
    end
  end

  belongs_to(
    :visitor,
    :class_name => 'User',
    :foreign_key => :visitor_id,
    :primary_key => :id
  )

  belongs_to(
    :visited_url,
    :class_name => 'ShortenedUrl',
    :foreign_key => :shortened_url_id,
    :primary_key => :id
  )
end

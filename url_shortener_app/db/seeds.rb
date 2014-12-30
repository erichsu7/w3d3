# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


sid = User.find_by(:email => 'sid@appacademy.io')
eric = User.find_by(:email => 'eric@appacademy.io')

ShortenedUrl.create_for_user_and_long_url!(sid, 'bleacherreport.com')
ShortenedUrl.create_for_user_and_long_url!(sid, 'reddit.com')
ShortenedUrl.create_for_user_and_long_url!(eric, 'pandora.com')
ShortenedUrl.create_for_user_and_long_url!(eric, 'rdio.com')

bleacher_report = ShortenedUrl.find_by(:long_url => 'bleacherreport.com')
reddit = ShortenedUrl.find_by(:long_url => 'reddit.com')
pandora = ShortenedUrl.find_by(:long_url => 'pandora.com')
rdio = ShortenedUrl.find_by(:long_url => 'rdio.com')

sports_tag = TagTopic.find_by(:name => 'sports')
music_tag = TagTopic.find_by(:name => 'music')
entertainment_tag = TagTopic.find_by(:name => 'entertainment')
news_tag = TagTopic.find_by(:name => 'news')

Tagging.create_tagging_from_topic_and_url(sports_tag, bleacher_report)
Tagging.create_tagging_from_topic_and_url(entertainment_tag, reddit)
Tagging.create_tagging_from_topic_and_url(music_tag, pandora)
Tagging.create_tagging_from_topic_and_url(music_tag, rdio)

Tagging.create_tagging_from_topic_and_url(entertainment_tag,
  ShortenedUrl.find_by(:long_url => 'appacademy.io'))

Tagging.create_tagging_from_topic_and_url(news_tag,
  ShortenedUrl.find_by(:long_url => 'google.com'))

Tagging.create_tagging_from_topic_and_url(entertainment_tag,
  ShortenedUrl.find_by(:long_url => 'netflix.com'))

Tagging.create_tagging_from_topic_and_url(news_tag,
  ShortenedUrl.find_by(:long_url => 'yahoo.com'))

Tagging.create_tagging_from_topic_and_url(music_tag,
  ShortenedUrl.find_by(:long_url => 'spotify.com'))

Tagging.create_tagging_from_topic_and_url(sports_tag,
  ShortenedUrl.find_by(:long_url => 'espn.com'))

Tagging.create_tagging_from_topic_and_url(news_tag,
  ShortenedUrl.find_by(:long_url => 'newyorktimes.com'))

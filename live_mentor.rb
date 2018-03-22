require 'json'

require './models/user'
require './models/profile'
require './models/social_network'
require './models/facebook'
require './models/twitter'

class LiveMentor
  attr_accessor :users

  KEY_LINE = %w[
    id
    email
    tags
    profiles.facebook.id
    profiles.facebook.picture
    profiles.twitter.id
    profiles.twitter.picture
  ].freeze

  def initialize(data = [])
    @users = data.map { |d| User.new(d) }
  end

  def to_csv_with_keys
    KEY_LINE.join(',') + "\n" + to_csv
  end

  def to_csv
    users.map do |user|
      [
        user.id, user.email, user.tags, user.profiles.facebook.id,
        user.profiles.facebook.picture, user.profiles.twitter.id,
        user.profiles.twitter.picture
      ].join(',')
    end.join("\n")
  end
end

file = File.new('users.json')
profiles_hash = JSON.parse(file.read)
live_mentor = LiveMentor.new(profiles_hash)

# p live_mentor.to_csv_with_keys
File.open('users.csv', 'w') { |f| f.write(live_mentor.to_csv_with_keys) }

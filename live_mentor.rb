require 'json'
require 'net/http'
require 'uri'

require './models/user'
require './models/social_network'
require './models/facebook'
require './models/twitter'

class LiveMentor
  attr_accessor :users

  KEY_LINE = 'id, email, tag, facebook, twitter'

  def initialize(data = [])
    @users = data.map { |d| User.new(d) }
  end
end

file = File.new('users.json')
profiles_hash = JSON.parse(file.read)
l = LiveMentor.new(profiles_hash)
p l.users
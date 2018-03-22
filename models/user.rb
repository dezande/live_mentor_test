require 'twitter'
require 'facebook'

class User
  attr_accessor :id, :email, :tag, :facebook, :twitter

  def initialize(data = {})
    @id = data[:id]
    @email = data[:email]
    @tag = data[:tag].join(', ')
    @facebook = Facebook.new(data[:facebook])
    @twitter = Twitter.new(data[:twitter])
  end
end
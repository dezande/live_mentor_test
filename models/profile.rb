class Profile
  attr_accessor :facebook, :twitter

  def initialize(data = [])
    @facebook = Facebook.new(data['facebook'])
    @twitter = Twitter.new(data['twitter'])
  end
end
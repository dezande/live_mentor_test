class User
  attr_accessor :id, :email, :tag, :facebook, :twitter

  def initialize(data = {})
    @id = data['id']
    @email = data['email']
    @tag = data['tags'].join(', ')
    @facebook = Facebook.new(data['profiles']['facebook'])
    @twitter = Twitter.new(data['profiles']['twitter'])
  end
end
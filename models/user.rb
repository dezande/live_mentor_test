class User
  attr_accessor :id, :email, :profiles, :facebook, :twitter
  attr_writer :tags

  def initialize(data = {})
    @id = data['id']
    @email = data['email']
    @tags = data['tags'].join(',')
    @profiles = Profile.new(data['profiles'])
  end

  def tags
    '"' + @tags + '"'
  end
end
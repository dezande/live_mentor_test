class SocialNetwork
  attr_accessor :id, :picture

  def initialize(data = {})
    @id = data[:id]
    @picture = data[:picture]
  end
end
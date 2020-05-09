class User
  attr_writer :name, :nickname, :work, :bio, :location, :website, :pinned
  attr_reader :pinned, :summary, :name, :nickname, :work, :bio, :location, :website

  def initialize
    @summary = []
    @pinned	= []
  end
end

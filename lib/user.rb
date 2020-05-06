class User
	attr_accessor :name, :nickname, :work, :bio, :location, :website, :pinned, :counters, :summary

	def initialize
		@counters = []
		@summary = []
		@pinned	= []
	end
end

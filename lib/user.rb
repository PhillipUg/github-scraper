



class User
	include UrlParser

	# attr_reader :get_name

	
	def initialize(username)
		@username = username
	end

	def get_name
		get_username(@username)
	end

	def get_nickname

	end

	def get_work
		
	end

	def get_location
		
	end

	def get_email
		
	end

	def get_bio
		
	end

	def get_pinned_repos

	end

	def get_repos

	end

	def get_projects

	end

	def get_packages

	end

	def get_stars

	end

	def get_followers

	end

	def get_following

	end
end


# def find_indexes_for(html, identifier)
# 	found_indexes = []
# 	current_index = 0
# 	while current_index != nil
# 		current_index = html[(current_index + 1)..-1].index(identifier)
# 		if current_index != nil
# 			current_index += 1
# 			if found_indexes.any?
# 				current_index = found_indexes.last + current_index
# 			end
# 			found_indexes << current_index
# 		end
# 	end
# 	found_indexes
# end

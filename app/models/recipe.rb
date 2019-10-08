#require 'httparty'
#require 'pp'

class Recipe
	include HTTParty
	
	FOOD2FORK_KEY=ENV["FOOD2FORK_KEY"]
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'

	base_uri "http://#{hostport}/api"
	default_params key: FOOD2FORK_KEY 
	format :json

	def self.for term
		get("/search", query:{q: term})["recipes"]
	end

end

#pp Recipe.for 'lamb'

#https://www.food2fork.com/api/search?key=20d5dd39b5e8a46a002d154f31d24e8e&q=chicken%20breast&page=2 
#https://www.food2fork.com/api/search?key=20d5dd39b5e8a46a002d154f31d24e8e&q=lamb&sort=r

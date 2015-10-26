require 'net/http'
# require 'json'
# require 'awesome_print'

class APIS::Itunes
	attr_accessor :song_list

	def fetch_data_and_parse(param_uri)
		puts "STEP 2"
		uri = URI(param_uri)
		response = Net::HTTP.get(uri)
		ap parsed = JSON.parse(response)
		#pull_title_and_id(parsed)
#		add_to_songs_list(parse)
	end



# This search method allows us to make a call to the URL, and
# parse the JSON that comes in response
# Every API call we make needs this code, so we have it here for DRY code
	def search_by_term(term)
		puts "STEP 1"
		fetch_data_and_parse("https://itunes.apple.com/search?term=#{URI.encode(term)}")
	end

	# def search_by_term
	# 	puts "STEP 3"
	# 	song1 = parsed["results"][0]
	# 	hash = {}
	# 	hash[:name] = song1["trackName"]
	# 	hash[:song_list] = song1["trackId"]
	# 	Song.new(hash)
	# end

def pull_title_and_id(parsed)
	puts "STEP 3"
	song1 = parsed["results"][0]
	hash = {}
	hash[:name] = song1["trackName"]
	hash[:song_id] = song1["trackId"]
	Song.new(hash)
end



# This URL is used to access the itunes DB of song information
	def search_by_id(param_id)
		my_url = "http://itunes.apple.com/lookup?id=#{param_id}"
		uri = URI(my_url)
		fetch_data_and_parse(uri)
	end

end
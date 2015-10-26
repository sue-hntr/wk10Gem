require 'net/http'
# require 'json'
# require 'awesome_print'

class APIS::Itunes
	attr_accessor :song_list

	def fetch_data_and_parse(param_uri)
		puts "STEP 2"
		uri = URI(param_uri)
		response = Net::HTTP.get(uri)
		parsed = JSON.parse(response)
		pull_title_and_id(parsed)
#		add_to_songs_list(parse)
	end

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

	def search_by_id(param_id)
		my_url = "http://itunes.apple.com/lookup?id=#{param_id}"
		uri = URI(my_url)
		fetch_data_and_parse(uri)
	end

end
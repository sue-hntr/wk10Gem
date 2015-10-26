class SongsController < ApplicationController


	def index
		i = APIS::Itunes.new
		@songs = i.search_by_term("Drake")
	end

end

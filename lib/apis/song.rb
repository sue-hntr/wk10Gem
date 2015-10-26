class Song
	attr_accessor :title, :song_id

	def initialize(options={})
		@title = params[:name]
		@song_id = params[:song_id]
	end

end
class Song < ActiveRecord::Base
		belongs_to :users

  attr_accessor :title, :song_id

  def initialize(sue={})
    @title = sue[:name]
    @song_id = sue[:song_id]
  end

end

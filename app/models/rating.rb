class Rating < ActiveRecord::Base
	belongs_to :beer


	def to_s
		x = beer.name
		y = self.score
		"#{x} #{y}"
		
	end

end

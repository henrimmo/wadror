class Beer < ActiveRecord::Base
	include RatingAverage
	belongs_to :brewery
	has_many :ratings, dependent: :destroy



	def to_s
		x = self.name
		y = brewery.name
		"#{x} (#{y})"


	end

end

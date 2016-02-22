class Beer < ActiveRecord::Base
	include RatingAverage

	belongs_to :style
	belongs_to :brewery
	has_many :ratings, dependent: :destroy
	has_many :raters, through: :ratings, source: :user

	validates :name, presence: true
	validates :style, presence: true


	def to_s
		x = self.name
		y = brewery.name
		"#{x} (#{y})"


	end

	def average
		return 0 if ratings.empty?
		ratings.map{ |r| r.score}.sum / ratings.count.to_f
	end
end

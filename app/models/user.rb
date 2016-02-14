class User < ActiveRecord::Base
	include RatingAverage

	has_many :ratings, dependent: :destroy
	has_many :beers, through: :ratings
	has_many :memberships, dependent: :destroy
	has_many :beer_clubs, through: :memberships
	

	has_secure_password

	validates :username, uniqueness: true, 
						 length: { in: 3..15}


	validate :password_complexity
	
	def password_complexity
     if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d). /) and password.length < 4
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit and lenght must be atleast 4"
     end
  	end


  	def to_s
  		x = self.username
  		"#{x}"
  	end
	
	def favorite_beer
    	return nil if ratings.empty?
    	ratings.order(score: :desc).limit(1).first.beer
  	end

  	def allows
	 	t = []
	    
	    ratings.each do |rating| 
	    	t << rating.beer.style
	    end
	    
	    puts t[2]


  	end 


end

module RatingAverage  
  extend ActiveSupport::Concern


  def average_rating
    a=ratings.to_a
    summa = []
    a.each do |alkio|
        summa << alkio.score
      end 
    summa.inject{ |sum, el| sum + el }.to_f / summa.size
  end 
end
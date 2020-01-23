class Show < ActiveRecord::Base

  def self.highest_rating
    Show.maximum(:rating)
  end

  def self.lowest_rating
    Show.minimum(:rating)
  end

  def self.most_popular_show
    pop = Show.where("#{highest_rating}").order(rating: :desc)
    pop[0]
  end

  def self.least_popular_show
    nott = Show.where("#{highest_rating}").order(rating: :asc)
    nott[0]
  end

  def self.ratings_sum
    Show.sum("rating")
  end

  def self.popular_shows
    Show.where("rating > 5")
  end

  def self.shows_by_alphabetical_order
    alpha = Show.order(name: :asc)
  end

end

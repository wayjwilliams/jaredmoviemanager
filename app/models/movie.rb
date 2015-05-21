class Movie < ActiveRecord::Base
    validates :title, :format, :length, :release_year, :rating, presence: true
    validates :title, length: {
    minimum: 1,
    maximum: 50,
    }
    validates :length, :release_year, :rating, numericality: true
end
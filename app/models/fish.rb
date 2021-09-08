class Fish < ApplicationRecord
    belongs_to :location
    belongs_to :angler 
    accepts_nested_attributes_for :location
    validates :species, presence: true
    validates :color, presence: true
    validates :weight, numericality: {greater_than: 0, less_than: 100}
    validates :age, presence: true

    scope :order_by_weight, -> {order(weight: :asc)}
    # scope :order_by_city, -> {order(:city)}
    scope :filter_by_location, -> ( location) {where location: location }
    def location_attributes=(hash_of_attributes)
        if !hash_of_attributes["city"].blank?
            self.location = Location.find_or_create_by(hash_of_attributes)
        end
    end

    def species_and_color
        " Species: #{self.species.capitalize} Color: #{self.color.capitalize} Location: #{self.location.city} "
    end

    # def self.order_by_weight
    #     self.order(:weight)
    # end
end

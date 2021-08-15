class Fish < ApplicationRecord
    belongs_to :location
    belongs_to :angler 
    accepts_nested_attributes_for :location
    validates :species, presence: true
    validates :color, presence: true
    validates :weight, numericality: {greater_than: 0, less_than: 100}
    validates :age, presence: true

    scope :order_by_weight, -> {order(weight: :desc)}
    # scope :order_by_city, -> {order(:city)}

    def location_attributes=(hash_of_attributes)
        if !hash_of_attributes["city"].blank?
            self.location = Location.find_or_create_by(hash_of_attributes)
        end
    end

    def species_and_color
        "#{self.species} - #{self.color} - #{self.location.city} "
    end

    # def self.order_by_weight
    #     self.order(:weight)
    # end
end

class Fish < ApplicationRecord
    belongs_to :location

    validates :species, presence: true
    validates :color, presence: true
    validates :weight, numericality: {greater_than: 0, less_than: 100}
    validates :age, presence: true


    def species_and_color
        "#{self.species} - #{self.color}"
    end

    def self.order_by_weight
        self.order(:weight)
    end
end

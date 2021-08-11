class Fish < ApplicationRecord

    def species_and_color
        "#{self.species} - #{self.color}"
    end

    def self.order_by_weight
        self.order(:weight)
    end
end

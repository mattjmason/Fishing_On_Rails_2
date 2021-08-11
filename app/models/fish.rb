class Fish < ApplicationRecord

    def species_and_color
        "#{self.species} - #{self.color}"
    end
end

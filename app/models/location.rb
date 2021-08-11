class Location < ApplicationRecord
has_many :fish
has_many :anglers, through: :fish
accepts_nested_attributes_for :fish, reject_if: proc { |attributes| attributes['color'].blank? || attributes['weight'].blank? || attributes['age'].blank? || attributes['species'].blank? }
validates :city, presence: true
end

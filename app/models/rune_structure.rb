class RuneStructure < ApplicationRecord
    belongs_to :structure
    has_many :runes
end

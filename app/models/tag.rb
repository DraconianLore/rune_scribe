class Tag < ApplicationRecord
    has_and_belongs_to_many :runes
    has_and_belongs_to_many :structures

    def used_in
        self.runes.count + self.structures.count
    end
end

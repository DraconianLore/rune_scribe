class Rune < ApplicationRecord
    has_and_belongs_to_many :structures
end

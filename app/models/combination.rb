class Combination < ApplicationRecord

    scope :recently_discovered, -> { where(recent > 0) }




end

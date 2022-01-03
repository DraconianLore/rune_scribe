class User < ApplicationRecord
    has_secure_password
    # validates email
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    validates :character, presence: true, uniqueness: true

    private
    def level_up
        puts "Levelling up #{self.character}"
        # logic to level up a character
    end

end


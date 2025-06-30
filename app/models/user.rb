class User < ApplicationRecord
    VALID_EMAIL_REGEX = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/i
    has_many :articles
    validates :username, presence: true,
                                uniqueness: { case_sensitive: false },
                                length: { minimum: 3, maximum: 25 }
    validates :email, presence: true, 
                                uniqueness: { case_sensitive: false },
                                length: { maximum: 105 },
                                format: { with: VALID_EMAIL_REGEX }
end

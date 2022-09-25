class Employee < ApplicationRecord
	before_save { first_name.capitalize! }
	before_save { last_name.capitalize! }

	validates :first_name, presence: true, length: { maximum: 30 }
	validates :last_name, presence: true, length: { maximum: 30 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	validates :bio, presence: true, length: { maximum: 300 }
end

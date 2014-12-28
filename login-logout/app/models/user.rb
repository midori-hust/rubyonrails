class User < ActiveRecord::Base
	before_save {self.email = email}
	validates :name, presence: true, length: {maximum: 50}
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	has_secure_password
	validates :password, length: {minimum: 6}	
end

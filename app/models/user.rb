

class User < ApplicationRecord
	validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

	has_secure_password
	
	has_many :lists
	has_many :authentications, dependent: :destroy

	def self.create_with_auth_and_hash(authentication, auth_hash)

		user = self.create!(
			first_name: auth_hash["extra"]["raw_info"]["name"],
			email: auth_hash["extra"]["raw_info"]["email"],
			password: SecureRandom.hex(5)
			)
		user.authentications << authentication
		return user
	end

    # grab fb_token to access Facebook for user data
    def fb_token
    	x = self.authentications.find_by(provider: 'facebook')
    	return x.token unless x.nil?
    end
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  end

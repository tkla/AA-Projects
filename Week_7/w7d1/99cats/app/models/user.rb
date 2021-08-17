# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string           not null
#
class User < ApplicationRecord
    validates :users, :username, presence: true 
    validates :password, length: {minimum: 6}, allow_nil: true

    attr_reader :password 

    def reset_session_token!
        session_token = SecureRandom::urlsafe_base64 
        self.save!
        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password) 
        @password = password 
    end

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && is_password?(password) 
            user 
        else 
            nil 
        end
    end

    
end

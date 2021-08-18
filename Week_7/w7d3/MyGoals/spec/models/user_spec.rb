require 'rails_helper'

RSpec.describe User, type: :model do
  #Validations
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_length_of(:password).is_at_least(6)}

  subject (:dog) {FactoryBot.create(:user)}
  it {should validate_uniqueness_of(:username)}
  it {should validate_uniqueness_of(:email)}
  it {should validate_presence_of(:session_token)}

  #Associations -Todo

  describe 'find_by_credentials' do 
    it 'should return a user if given the correct credentials' do 
      user = User.find_by_credentials('Dog', 'password')
      expect(user.name).to eq('Dog')
    end

    it 'should return nil if credentials are incorrect' do 
      user = User.find_by_credentials('', '')
      expect(user).to eq(nil)
    end
  end

  describe 'password_encryption' do 
    it 'should not save password to db' do 
      user = User.find_by(username: 'Dog')
      expect(user.password).to eq('password')
      expect(user.password_digest).not_to eq('password')
    end
    it 'should encrypt password with bcrypt'
      expect(BCrypt::Password).to recieve(:create).with('password')
      FactoryBot.build(:user, password: 'password')
  end
end
  
end

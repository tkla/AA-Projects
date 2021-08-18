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

  #Controller tests 
  
end

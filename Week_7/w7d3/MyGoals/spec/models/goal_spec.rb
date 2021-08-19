require 'rails_helper'

RSpec.describe Goal, type: :model do

  it { should validates_presence_of(:title) }
  it { should validates_presence_of(:author_id) }

  before :each do 
    @user = FactoryBot.create(:user)
    @goal = FactoryBot.create(:goal)
  end

  #Associations 
  it { should belong_to(:user) }
end

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'GET #new' do 
        it 'Render new users template' do 
            get :new

            expect(response).to render_template(:new)
        end 
    end

    describe 'POST #create' do 
        context 'With valid params' do 
            let(:user_params) do 
                { 
                    user: {
                        username: "Dog",
                        email: Faker::Internet.email,
                        password: "password" 
                    }
                }
            end

            it "Should login user" do 
                post :create, params: user_params 
                user = User.find_by(username: "Dog")
                expect(session[:session_token]).to eq(user.session_token)
            end

            it "Redirects to users show page" do 
                post :create, params: user_params 
                user = User.find_by(username: "Dog")
                expect(response).to redirect_to(user_url(user)) 
            end
        end

        context "With invalid params" do 
            it "Validates presence of username, password, and email and to render new template with errors" do 
                post :create, params: {user: {username: 'Dog', password: 'password', email: Faker::Internet.email}}
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present 
            end
        end
    end
end

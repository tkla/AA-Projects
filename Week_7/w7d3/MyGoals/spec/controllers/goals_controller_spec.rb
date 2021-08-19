require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

    describe 'GET NEW' do 
        it "render new goals template" do 
            get :new
            expect(response).to render_template(:new)  
        end
    end

    describe "POST CREATE" do 
        context "With valid params" do 
            let(:goal_params) do {
                goal: { 
                    title: "Score", 
                    author_id: 1
                }
            }

            it "Should add a goal for a user" do 
                post :create, params: :goal_params 
                goal = Goal.find_by(title: "Score", author_id: 1)
                expect(response).to redirect_to(goal_url(goal))
            end
        end

        context "With invalid params" do 
            it "validates presence of author and title and render new template with errors" do
                post :create, params: {goal: {title: "", author_id: "" }}
                expect(response).to render_template(:new) 
                expect(flash[:error]).to be_present  
            end 
        end
    end
end

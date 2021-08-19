require 'rails_helper' 

#describe => feature 
#it => scenario
#before => background 
feature 'Sign Up' do
   background :each do 
    visit(new_user_path)
   end
   
   scenario 'should have sign up and create user' do
    expect(page).to have_content "Sign Up"
    expect(page).to have_button "Create User"
    # expect(page.find_button(value: 'Create User')).not_to raise_ElementNotFound
    end

    scenario 'should have forms for username, email and password' do
        expect(page).to have_field("Username")
        expect(page).to have_field("Email")
        expect(page).to have_field("Password")
    end

    scenario 'should redirect to users_show after signing up' do 
        fill_in('Username', with: "Dog")
        fill_in('Email', with: Faker::Internet.email)
        fill_in('Password', with: "password")
        click_button("Create User")
        expect(page).to have_content("Dog")
        user = User.find_by(username: "Dog")
        expect(current_path).to eq(user_path(user))
    end

end
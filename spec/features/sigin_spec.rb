require 'rails_helper'

feature 'Singup' do
  scenario 'Signup, Singout and Signin' do
    visit '/'

    expect( User.count ).to eq 0
    expect( Identity.count ).to eq 0
    expect( Authentication.count ).to eq 0

    # Sign up
    click_link 'signup'
    expect(current_path).to eq '/user/new'

    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_on 'Save changes'
    expect(current_path).to eq '/'
    expect(page).to have_content 'signout'
    expect( User.count ).to eq 1
    expect( Identity.count ).to eq 1
    expect( Authentication.count ).to eq 1

    # Sign out
    click_link 'signout'

    # Sign in
    click_link 'signin'
    fill_in 'auth_key', with: 'user@example.com'
    fill_in 'password', with: 'password'
    click_on 'Login'
    expect(current_path).to eq '/'
    expect( User.count ).to eq 1
    expect( Identity.count ).to eq 1
    expect( Authentication.count ).to eq 1
  end

  scenario '', js: true do
    visit '/'
    expect(current_path).to eq '/'
  end
end

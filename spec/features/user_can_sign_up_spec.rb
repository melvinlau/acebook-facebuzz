require 'rails_helper'

RSpec.feature "Sign_up", type: :feature do

  scenario "gets redirected to index/welcome page if not already signed up" do
    visit "/posts"
    expect(current_path).to eq '/'
  end

  scenario "can access sign up page" do
    visit "/users/sign_up"
    expect(page).to have_button("Sign up")
    expect(page).to have_field("user[email]")
    expect(page).to have_field("user[password]")
    expect(page).to have_field("user[first_name]")
    expect(page).to have_field("user[last_name]")
  end

  scenario "can't sign up with invalid email address 'testtest.com'" do
    visit "/users/sign_up"
    fill_in 'user[first_name]', with: 'John'
    fill_in 'user[last_name]', with: 'Doe'
    fill_in 'user[email]', with: 'testtest.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Join the buzz gang!")
    expect(page).to have_css("input", :count => 7)
    expect(page).to have_content 
    "error prohibited this user from being saved: Email is invalid"
      
  end

  scenario "can't sign up with a password shorter than 6 characters" do
    visit "/users/sign_up"
    fill_in 'user[first_name]', with: 'John'
    fill_in 'user[last_name]', with: 'Doe'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'pass'
    fill_in 'user[password_confirmation]', with: 'pass'
    click_button 'Sign up'
    expect(page).to have_content("Join the buzz gang!")
    expect(page).to have_css("input", :count => 7)
    expect(page).to have_content 
    "error prohibited this user from being saved:
      Password is too short (minimum is 6 characters)"
      
  end

  scenario "can't sign up with a password longer than 10 characters" do
    visit "/users/sign_up"
    fill_in 'user[first_name]', with: 'John'
    fill_in 'user[last_name]', with: 'Doe'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'passwordpass'
    fill_in 'user[password_confirmation]', with: 'passwordpass'
    click_button 'Sign up'
    expect(page).to have_content("Join the buzz gang!")
    expect(page).to have_css("input", :count => 7)
    expect(page).to have_content 
    "error prohibited this user from being saved:
      Password is too long (maximum is 10 characters)"
      
  end

  scenario 'Can create a new user account' do
    visit "/users/sign_up"
    fill_in 'user[first_name]', with: 'John'
    fill_in 'user[last_name]', with: 'Doe'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("You have signed up successfully")
    expect(current_path).to eq('/posts')
  end
end

require 'rails_helper'

RSpec.feature "Like post", type: :feature do
  scenario "User can like their post and number of likes will change" do
    create_user
    login_user
    visit '/posts'
    create_post
    find(:css, 'i.fa.fa-thumbs-up.fa-lg.has-text-primary').click
    expect(page).to have_content('1')
  end
  
  scenario "User can like other user's post and number of likes will change" do
    create_user
    login_user
    visit '/posts'
    create_post
    find(:css, 'i.fa.fa-thumbs-up.fa-lg.has-text-primary').click
    logout_user
    
    create_user_two
    login_user_two
    visit '/posts'
    find(:css, 'i.fa.fa-thumbs-up.fa-lg.has-text-primary').click
    expect(page).to have_content("2")
  end
  
  scenario "User can unlike the post" do
    create_user
    login_user
    visit '/posts'
    create_post
    find(:css, 'i.fa.fa-thumbs-up.fa-lg.has-text-primary').click
    find(:css, 'i.fa.fa-thumbs-up.fa-lg.has-text-primary').click
    expect(page.first('span.vote_count')).not_to have_content('1')
    expect(page.first('span.vote_count')).not_to have_content('2')
  end
  
end

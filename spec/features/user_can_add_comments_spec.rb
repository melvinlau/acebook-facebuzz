require 'rails_helper'
require 'helpers/users_helpers'
require 'helpers/posts_helpers'

RSpec.feature "Add comment", type: :feature do

  let(:comment_body) { 'This is a comment.' }

  scenario "Can add a comment to a post" do
    create_user
    login_user
    create_post
    within ('.post') do
      fill_in 'message', with: comment_body
      click_button 'Add Comment'
    end
    expect(page).to have_content(comment_body)
  end
end

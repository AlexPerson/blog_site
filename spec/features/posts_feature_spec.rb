require 'rails_helper'

feature 'posts' do
  scenario 'no posts have been added' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
  end
end

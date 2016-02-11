require 'rails_helper'

feature 'posts' do
  scenario 'no posts have been added' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
  end
end

context 'posts have been added' do
  before do
    Post.create(title: 'WOOHOO!',
          description: 'Im a buncha teeeeeeeeeeeeeeeext',
             username: 'MrBigShot')
  end

  scenario 'display posts' do
    visit '/posts'
    expect(page).to have_content('WOOHOO!')
    expect(page).not_to have_content('No posts yet')
  end
end

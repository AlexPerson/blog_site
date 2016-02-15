require 'rails_helper'

feature 'posts' do
  context 'when no posts have been added' do
    scenario 'no posts are displayed' do
        visit '/posts'
        expect(page).to have_content 'No posts yet'
    end
  end
  context 'when a post has been added' do
    before do
      Post.create(title: 'WOOHOO!',
            description: 'Im a buncha teeeeeeeeeeeeeeeext',
               username: 'MrBigShot')
      visit '/posts'
    end
    scenario 'the title of the post is displayed on the homepage' do
      expect(page).to have_content('WOOHOO!')
    end
    scenario 'the description of the post is displayed on the homepage' do
      expect(page).to have_content('Im a buncha teeeeeeeeeeeeeeeext')
    end
    scenario 'the username of the user who created the post is displayed on the homepage' do
      expect(page).to have_content('MrBigShot')
    end
    scenario 'the homepage should not say that there are no posts yet' do
      expect(page).not_to have_content('No posts yet')
    end
  end
  context 'when creating posts' do
    scenario 'the user is prompted to fill out a form, then the new post is displayed' do
      visit '/posts'
      sign_up
      click_link 'Add a post'
      fill_in 'Title', with: "I\'m a POST!"
      fill_in 'Description', with: "Ooooh how descriptive..."
      click_button 'Create Post'
      expect(page).to have_content 'I\'m a POST!'
      expect(page).to have_content 'Ooooh how descriptive...'
      expect(page).to have_content 'username'
      expect(current_path).to eq '/posts'
    end

    scenario 'users cannot create posts without being logged in' do
      visit '/posts'
      click_link 'Add a post'
      expect(page).to have_content 'Log in'
    end
  end
end

def sign_up
  visit('/')
  click_link('Sign Up')
  fill_in('Username', with: 'username')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

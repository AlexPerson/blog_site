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

context 'creating posts' do
  scenario 'prompts user to fill out a form, then displays the new post' do
    visit '/posts'
    sign_up
    click_link 'Add a post'
    fill_in 'Title', with: "I\'m a POST!"
    fill_in 'Description', with: "Ooooh how descriptive..."
    click_button 'Create Post'
    expect(page).to have_content 'I\'m a POST!'
    expect(page).to have_content 'Ooooh how descriptive...'
    expect(current_path).to eq '/posts'
  end

  scenario 'users cannot create posts without being logged in' do
    visit '/posts'
    click_link 'Add a post'
    expect(page).to have_content 'Log in'
  end
end

def sign_up
  visit('/')
  click_link('Sign Up')
  fill_in('Username', with: 'slimShady')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

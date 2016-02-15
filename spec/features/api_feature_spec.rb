require 'rails_helper'

feature 'API' do
  before do
    Post.create(title: 'TITLE',
          description: 'DESCRIPTION',
             username: 'USERNAME')
  end
  scenario 'post data is returned in xml format when user visits /api/xml/posts' do
    visit '/api/xml/posts'
    expect(page).to have_content(
    'TITLE DESCRIPTION USERNAME'
    )
  end
  scenario 'post data is returned in JSON format when user visits /api/json/posts' do
    visit '/api/json/posts'
    expect(page).to have_content(
    '"title":"TITLE","description":"DESCRIPTION","username":"USERNAME"'
    )
  end
end

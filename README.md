
# About blog_site

Behold!  The humble beginnings of a basic blog site!  Built using Ruby on Rails, running on a Postgresql database, Rspec, Capybara, and Shoulda for testing, blog_site used the devise gem to create user profiles and bootstrap for a little extra front-end shine.




# So far…

- Users sign up, sign out, and sign in again.

- Users can only create a post when signed in.

- Users can retrieve post data in JSON and XML formats by going to localhost:3000/api/xml/posts or localhost:3000/api/json/posts

- Posts are displayed on the front page complete with their Title, Description, and Author.




# Things to improve:

- Make a background worker that spawns every 5min and marks a random post as ‘Featured’

- I would display the featured post separately on the side on the first screen where the posts are

- I would take more time to develop the styling.



# To install and run this app...

### 1. Git clone the repository

### 2. Run bundle install

### 3. Run rake db:create

### 4. Run rake db:migrate

### 5. Run rake db:seed

### 6. Run bin/rails s from the command line.

### 7. Open your browser to localhost:3000

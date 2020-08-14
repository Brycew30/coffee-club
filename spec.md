# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
  - Sinatra is used
- [x] Use ActiveRecord for storing information in a database
  - Tables and migrated information are stored with ActiveRecord
- [x] Include more than one model class (e.g. User, Post, Category)
  - User model and Coffee model
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  - A User has many Coffees
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  - A Coffee belongs to a User
- [x] Include user accounts with unique login attribute (username or email)
  - Accounts are made with name, username, and password. Username & password are used to login
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  - C: ```get '/coffees/new'``` R: ```get '/coffees/:id'``` U: ```get '/coffees/:id/edit'``` D: ```delete '/coffees/:id'```
- [x] Ensure that users can't modify content created by other users
  - User must be logged in and current user == coffee.user to edit specific coffee
- [x] Include user input validations
  - authenticate with bcrypt gem via ```if @user && @user.authenticate(params[:password])```
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
  - ```flash[:message]``` for successful messages and ```flash[:error]``` for error messages
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
  - README is included

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

require '../rails_helper'

feature 'implement chat' do

  scenario 'Users must be able to create an account providing a valid email address' do
    visit('http://localhost:3000/sessions/new')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Log In')
    expect(page).to have_content('Sign up')
    click_on('Sign up')
    fill_in('Email', with: 'test@test.com')
    fill_in('user_password', with: 'test')
    fill_in('user_password_confirmation', with: 'test')
    click_on('Log in')
    expect(page).to have_content('Enter your message')
  end

  scenario 'Users must be able to log in providing a valid email address and password' do
    visit('http://localhost:3000/sessions/new')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'test')
    click_on('Log in')
    expect(page).to have_content('Enter you message')
  end

  scenario 'Error message is displayed if invalid email address is entered' do
    visit('http://localhost:3000/sessions/new')
    fill_in('Email', with: 'dfdfd')
    click_on('Log in')
    expect(page).to have_content("Please include an '@' in the email address. 'dfdfd' is missing an '@'.")
  end

  scenario 'Once logged in users must be able to send and receive messages' do
    visit('http://localhost:3000/sessions/new')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'test')
    click_on('Log in')
    fill_in('Enter your message', with: 'Hello')
    click_on('Send')
    #I needed to refresh page to view messages
    page.evaluate_script("window.location.reload()")
    expect(page).to have_content("Hello")
  end

  scenario 'it has only one channel/room and all the users subscribed will have access to the only available channel' do
    visit('http://localhost:3000/sessions/new')
    click_on('Sign up')
    fill_in('Email', with: 'test1@test1.com')
    fill_in('user_password', with: 'test1')
    fill_in('user_password_confirmation', with: 'test1')
    click_on('Log in')
    expect(page).to have_content("Hello")
  end

end




require '../rails_helper'

feature 'implement chat' do

  scenario 'Users must be able to create an account providing a valid email address' do
    visit('http://localhost:3000/sessions/new')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_conteny('Sign up')
    fill_in('Email', with: 'dfdfd')
    fill_in('Password', with: 'fffff')
    click_on('Sign up')
    expect(page).to have_content('Welcome')
  end

  scenario 'Once logged in users must be able to send and receive messages' do
    visit('http://localhost:3000/sessions/new')
    fill_in('Email', with: 'dfdfd')
    fill_in('Password', with: 'fffff')
    click_on('Sign up')
    fill_in('Message')
    click_on('Send')
    expect(page).to have_content('Message sent')
    click_on('Receive message')
    expect(page).to have_content('New message')
  end

  scenario 'it has only one channel/room and all the users subscribed will have access to the only available channel' do
    visit('http://localhost:3000/sessions/new')
    fill_in('Email', with: 'dfdfd')
    fill_in('Password', with: 'fffff')
    click_on('Sign up')
    expect(page).to have_content('Channel name')
  end

  scenario 'how many messages were sent and received in the last week' do

  end

  scenario 'the total number of messages received since the user has sent his last message' do

  end

end




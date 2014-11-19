require 'rails_helper'
require_relative 'helpers/user_helper'
require_relative 'helpers/post_helper'


context 'user not signed in' do

	it 'has a "sign in" link and a "sign up" link' do
		visit '/'
		expect(page).to have_link 'Sign in'
		expect(page).to have_link 'Sign up'
	end

	it 'does not have a "sign out" link when no one is signed in' do
		visit '/'
		expect(page).not_to have_link 'Sign out'
	end

end

 context 'user is signed in' do

 	before do
 		sign_up
 	end

 	it 'has a "sign out" link' do
		visit '/'
 		expect(page).to have_link 'Sign out'
 	end

 	it 'does not have a "sign up" link' do
 		visit '/'
 		expect(page).not_to have_link 'Sign up'
 	end

	it 'does not have a "sign in" link' do
 		visit '/'
 		expect(page).not_to have_link 'Sign in'
 	end
 end
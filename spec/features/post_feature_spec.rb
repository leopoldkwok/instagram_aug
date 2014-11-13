require 'rails_helper'

describe 'posts' do 
	context 'no posts have been added' do
		it 'should display a prompt message to add a post' do 
			visit '/posts' 
		expect(page).to have_content 'No posts yet'
		expect(page).to have_link 'Add a post'
	end
end

	context 'posts have been added' do 
		before do 
			Post.create(title: 'Here is a picture', picture: File.open('spec/images/photo.jpg'))
		end

		it 'displays a list of all posts' do 
			visit '/posts'
			expect(page).to have_content ('Here is a picture')
			expect(page).not_to have_content('No posts yet')
		end
	end

	xcontext 'time created' do 
    before do
      Post.create(title: 'Here is a picture', picture: File.open('spec/images/photo.jpg'))
    end
    it 'is displayed with a post' do 
      visit '/posts'
      expect(page).to have_content('less than a minute ago')
    end
  end



describe 'creating posts' do 
		it 'adds the posts from a form' do 
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'A brand new post'
			click_button 'Create post'
			
			expect(page).to have_content 'A brand new post'
			expect(current_path).to eq '/posts'
		end

		it 'displays no image, if no picture attached' do 
				visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'A brand new post'
			click_button 'Create post'

			expect(page).not_to have_css 'img.uploaded-pic'
		end

		it 'can attach an image to a post' do
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'A brand new post'
			attach_file 'Picture', Rails.root.join('spec/images/photo.jpg')
			click_button 'Create post'

			expect(page).to have_css 'img.uploaded-pic'
		end

	end

end 
require 'rails_helper'

describe 'posts' do
  context 'no posts have been added' do
    it 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(name: 'magic')
  end


    it 'should display posts' do
        visit '/posts'
        expect(page).to have_content('magic')
        save_and_open_page
        expect(page).not_to have_content('No posts')
    end
  end
end

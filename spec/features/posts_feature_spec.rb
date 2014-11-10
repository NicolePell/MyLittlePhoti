require 'rails_helper'

describe 'posts' do
  context 'no posts have been added' do
    it 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Create a Post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(name: 'magic')
    end

    it 'should display posts' do
        visit '/posts'
        expect(page).to have_content('magic')
        expect(page).not_to have_content('No posts')
    end
  end

  context 'viewing posts' do
    before do
      @magic = Post.create(name: 'magic')
    end

    it 'lets a user view a post' do
      visit '/posts'
      click_link 'magic'
      expect(page).to have_content 'magic'
      expect(current_path).to eq "/posts/#{@magic.id}"
    end
  end

  context 'deleting posts' do
    before do
      Post.create(name: 'magic')
    end

    it 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Delete magic'
      expect(page).not_to have_content 'magic'
      expect(page).to have_content 'Your post is destroyed'
    end
  end
end

describe 'creating posts' do
  it 'prompts the user to fill out a form, then displays the new restaurant' do
    visit '/posts'
    click_link 'Create a Post'
    fill_in 'Name', with: 'magic'
    click_button 'Post'
    expect(page).to have_content 'magic'
    expect(current_path).to eq '/posts'
  end

  context 'an invalid post' do
    it 'does not let you add a post that is too short' do
    visit '/posts'
    click_link 'Create a Post'
    fill_in 'Name', with: 'ma'
    click_button 'Post'
    expect(page).not_to have_content('ma')
    expect(page).to have_content('error')
    end
  end
end

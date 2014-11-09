require 'rails_helper'

describe 'commenting' do
  before do
    Post.create(name: 'magic')
  end

  it 'allows users to leave a comment using a form' do
    visit '/posts'
    click_link 'Comment on magic'
    fill_in 'Thoughts', with: 'Brohoof!'
    click_button 'Post comment'
    click_link 'magic'
    expect(page).to have_content('Brohoof!')
  end
end

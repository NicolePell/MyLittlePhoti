require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  it 'is not valid with a name of less than three characters' do
    post = Post.new(name: 'ma')
    expect(post).not_to be_valid
  end

end

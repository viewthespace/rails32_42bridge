require 'spec_helper'

RSpec.describe Post, type: :model do
  specify 'posts can have many comments' do
    post = Post.create(value: "My first post")
    post.comments.create(value: "Thats a silly thing to post")
    expect(post.comments.length).to eq 1
  end

  specify 'remove a comment and not longer shows up' do
    post = Post.create(value: "My first post")
    comment = post.comments.create(value: "Thats a silly thing to post")
    expect(post.comments.length).to eq 1
    comment.removed = true
    comment.save!
    expect(post.reload.comments).to be_empty
  end
end

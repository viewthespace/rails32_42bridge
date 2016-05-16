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

  specify 'ordering comments within a post' do
    post = Post.create(value: "My first post")
    comment2 = post.comments.create(value: "Thats a silly thing to post", position: 2)
    comment1 = post.comments.create(value: "Thats a silly thing to post", position: 1)
    expect(post.comments.to_a).to eq([comment1, comment2])
  end

  specify 'users on posts are uniq' do
    user = User.create(email: 'gracie@test.com')
    post = Post.create(value: "My first post")
    2.times { post.users << user }
    expect(post.users.count).to be 1
  end


end

# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'the truth' do
    assert true
  end

  test 'should not save the post without title' do
    post = Post.new
    assert_not post.save, "this won't failure"
  end

  test 'should save the post with title' do
    post = Post.new(title: 'some title')
    assert post.save, "this won't get any error"
  end
end

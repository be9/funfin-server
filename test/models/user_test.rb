require 'test_helper'

class UserTest < ActiveSupport::TestCase
  it 'generates password digest' do
    user = User.create(email: 'test1@example.org', name: 'Test', password: 'abcdefgh')

    _(user.password_digest.size).must_be :>=, 0
  end

  it 'generates an auth token' do
    user = User.create(email: 'test2@example.org', name: 'Test', password: 'abcdefgh')

    _(user.authentication_token.size).must_be :>=, 0
  end

  it 'downcases email' do
    user = User.create(email: 'TEST3@example.org', name: 'Test', password: 'abcdefgh')

    _(user.email).must_equal 'test3@example.org'
  end
end

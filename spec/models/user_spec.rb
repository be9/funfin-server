require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'generates password digest' do
    expect(user.password_digest.size).to be > 0
  end

  it 'generates an auth token' do
    expect(user.authentication_token.size).to be > 0
  end

  it 'downcases email' do
    user = create(:user, email: 'TEST3@example.org')

    expect(user.email).to eq 'test3@example.org'
  end
end

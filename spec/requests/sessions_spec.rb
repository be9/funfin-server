require 'rails_helper'

RSpec.describe "API V1 Sessions", type: :request do
  describe "POST /sessions" do
    let(:user) { create(:user) }

    it 'returns 401 if user does not exist' do
      post '/api/v1/sessions',
        params: { user: { email: 'nosuchuser@example.org', password: 'hehe' } }

      expect(response).to be_unauthorized
    end

    it 'returns 401 if user exists, but password is wrong' do
      user

      post '/api/v1/sessions',
        params: { user: { email: user.email, password: 'wrong' } }

      expect(response).to be_unauthorized
    end

    it 'works' do
      user

      post '/api/v1/sessions',
        params: { user: { email: user.email, password: 'qaswed' } }

      expect(response).to be_success

      json = JSON.parse(response.body)

      expect(json['id']).to eq user.id
      expect(json['name']).to eq user.name
      expect(json['email']).to eq user.email
      expect(json['authentication_token']).to eq user.authentication_token
    end
  end
end

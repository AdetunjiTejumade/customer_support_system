# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Users', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/signup', params: valid_attributes.json, headers: headers }

      xit 'creates a new user and returns status code 201' do
        expect(response).to have_http_status(201)
      end

      xit 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      xit 'returns an authentication token in the header' do
        expect(json['token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        binding
        expect(json['message'])
          .to match("Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Email is invalid, Password digest can't be blank, Password digest is too short (minimum is 6 characters)")
      end
    end
  end
end

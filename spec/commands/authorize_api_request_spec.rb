# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user) }
  let(:header) { { 'Authorization' => token_generator({ user_id: user.id }) } }
  subject(:invalid_request_obj) { described_class.new({}) }
  subject(:request_obj) { described_class.new(header) }

  describe '.call' do
    context 'when valid request' do
      it 'returns user object' do
        result = request_obj.call.as_json
        expect(result['user']).to eq(user.as_json)
      end
    end

    context 'when invalid request' do
      context 'when missing token' do
        it 'returns a Missing Token error' do
          result = invalid_request_obj.call
          expect(result.errors[:token]).to eq(['Missing token', 'Invalid token'])
        end
      end
    end
  end
end

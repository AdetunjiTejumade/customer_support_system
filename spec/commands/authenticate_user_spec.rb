# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticateUser do
  subject(:valid_context) { described_class.call(user.email, user.password) }
  subject(:invalid_context) { described_class.new('lala', 'pass') }

  describe '.call' do
    context 'when valid credentials' do
      let(:user) { create(:user) }

      it 'succeeds' do
        expect(valid_context).to be_success
      end
    end

    context 'when invalid credentials' do
      let(:user) { create(:user, password: 'lala') }

      it 'fails' do
        result = invalid_context.call.as_json
        expect(result['errors']['user_authentication']).to eq('invalid credentials')
      end
    end
  end
end

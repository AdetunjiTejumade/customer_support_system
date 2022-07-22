# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tickets', type: :request do
  let(:user) { create(:user) }
  let(:ticket) { build(:ticket) }
  let(:headers) { valid_headers }

  describe 'POST /tickets' do
    context 'when the request is valid' do
      before { post tickets_path, params: ticket.to_json, headers: headers }

      it 'creates a ticket' do
        expect(json['title']).to eq(ticket['title'])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post tickets_path, params: { title: 'No internet' }.to_json, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("Validation failed: Description can't be blank")
      end
    end
  end
end

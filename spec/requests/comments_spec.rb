# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments' do
  let!(:user) { create(:user) }
  let!(:ticket) { create(:ticket, user: user) }
  let!(:comment) { attributes_for(:comment, ticket: ticket, user: user) }
  let(:headers) { valid_headers }

  describe 'POST /comments' do
    context 'when the request is valid' do
      before do
        post ticket_comments_path(ticket),
             params: comment.to_json,
             headers: headers
      end
      context 'but an agent is yet to comment on the ticket' do
        it 'return a message that the user should wait' do
          expect(response).to have_http_status(200)
          expect(response.body).to match('Please wait for an agent to comment')
        end
      end
    end
  end
end

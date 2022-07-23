# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  validates :content, presence: true, length: { minimum: 5, maximum: 1000 }

  def self.get_comments_for_ticket(ticket_id)
    Comment.all.where(ticket_id: ticket_id).order(:created_at)
  end

  def self.first_commenter_agent?(ticket_id)
    first_comment = get_comments_for_ticket(ticket_id).first
    first_comment&.user ? first_comment.user.role == 'agent' : false
  end
end

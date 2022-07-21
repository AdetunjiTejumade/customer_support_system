# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user

  REQUEST_STATUSES = {
    open: 'open',
    solved: 'solved',
    pending: 'pending',
    in_progress: 'in_progress',
    assigned: 'assigned'
  }.freeze

  enum status: REQUEST_STATUSES

  validates :title, :description, presence: true

  def self.recent
    order('created_at DESC')
  end
end

# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  REQUEST_STATUSES = {
    open: 'open',
    complete: 'complete',
    pending: 'pending'
  }.freeze

  enum status: REQUEST_STATUSES

  validates :title, :description, presence: true

  def self.recent
    order('created_at DESC')
  end
end

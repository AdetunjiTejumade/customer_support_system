# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :tickets
  has_many :comments

  ROLES = %w[agent customer].freeze

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :role, inclusion: { in: ROLES,
                                message: '%<value>s is not a  valid role type' }
  validates :email, format: { with: VALID_EMAIL_REGEX }, presence: true,
                    length: { maximum: 200 }, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true, length: { minimum: 6 }

  def agent?
    role == 'agent'
  end

  def customer?
    role == 'customer'
  end
end

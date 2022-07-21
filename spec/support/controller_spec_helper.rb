# frozen_string_literal: true

module ControllerSpecHelper
  def token_generator(payload)
    JsonWebToken.encode(payload)
  end

  def expired_token_generator(payload)
    # JsonWebToken.encode({ user_id: user_id }, (Time.zone.now.to_i - 10))

    JsonWebToken.encode(payload)
  end

  def valid_headers
    {
      'Authorization' => token_generator({ user_id: user.id }),
      'Content-Type' => 'application/json'
    }
  end

  def invalid_headers
    {
      'Authorization' => nil,
      'Content-Type' => 'application/json'
    }
  end
end

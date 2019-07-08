class JsonWebToken
  # secret to encode and decode token
  # this is unique for every Rails application
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  # create a token based on the payload (user_id)
  # with expiration set to 24 hours
  def self.encode(payload, exp = 24.hours.from_now)
    # set expiry to 24 hours from creation time
    payload[:exp] = exp.to_i
    # sign token with application secret
    JWT.encode(payload, HMAC_SECRET)
  end

  # accept a token and attempt decoding it using the HMAC_SECRET
  # override JWT::DecodeError and handle it using by raising
  # ExceptionHandler::InvalidToke via the ExceptionHandler
  def self.decode(token)
    # get payload; first index in decoded Array
    body  = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body
    # rescue from all decode errors
  rescue JWT::DecodeError => e
    # raise custom error to be handled by custom handler
    raise ExceptionHandler::InvalidToken, e.message
  end
end

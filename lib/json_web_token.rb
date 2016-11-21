require 'jwt'

# JSON Web Token middleware
# Encodes and decodes tokens with 'jwt' gem
class JsonWebToken

  def self.encode(payload)
    return JWT.encode(payload, nil, 'none')
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, nil, false)[0])
  rescue
    nil
  end

end

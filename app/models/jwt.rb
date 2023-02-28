class Jwt
  SECRET_KEY = 'fuewfhkejnfieruhncweojclewmoicjewocnweo'

  def self.encode_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode_token(auth_header)
    token = auth_header.split(' ')[1]
    begin
      JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
    rescue StandardError => e
      []
    end
  end
end

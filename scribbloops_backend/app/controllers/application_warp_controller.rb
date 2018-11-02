class ApplicationWarpController < WarpCable::Controller

  def encode_token(payload)
    JWT.encode(payload, 'app_wide_secret_for_every_user')
  end

  def decoded_token
    if params[:authorization]
      token = params[:authorization].split[1]

      begin
        JWT.decode(token, 'app_wide_secret_for_every_user', true, algorithm: 'HS256')

      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  

end
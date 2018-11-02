class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    newUser = User.create(user_params)

    if newUser.valid?
      token = encode_token(user_id: newUser.id)
      render json: {
          user: newUser,
          # user: UserSerializer.new(newUser), // Serializer: data transfer optimized
          status: :created,
          jwt: token
        }, status: :created
      # render json: { user: UserSerializer.new(@newUser) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end



  private
  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :username, :password, :user_type)
  end

end
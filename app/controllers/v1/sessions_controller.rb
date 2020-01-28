module V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    def create
      @existing_user = User.find_by(access_token: params[:username])
      if @existing_user
        sign_in :user, @existing_user
        render json: @existing_user
      else
        @user = User.find_for_database_authentication(email: params[:username])
        return invalid_login_attempt unless @user

        if @user.valid_password?(params[:password]) || (@user.access_token == params[:username])
          sign_in :user, @user
          render json: @user, serializer: SessionSerializer, root: nil
        else
          invalid_login_attempt
        end        
      end


    end

    private

    def invalid_login_attempt
      warden.custom_failure!
      render json: {error: t('sessions_controller.invalid_login_attempt')}, status: :unprocessable_entity
    end

  end
end
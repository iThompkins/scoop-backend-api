module V1
	class RegistrationsController < Devise::RegistrationsController
	  skip_before_action :authenticate_user_from_token!

	  def create
	  	@user = User.create(
	  						email: params[:username], 
	  						password: params[:password],
	  						tender_status: params[:bartenderStatus],
	  						shotgirlStatus: params[:shotgirlStatus],
	  						doormanStatus: params[:doormanStatus]
	  						)
	  	if @user.save
        render json: @user
	  	else
     	 render json: {error: t('failed_to_create_user')}, status: :unprocessable_entity
	  	end
	  end 
	end
end
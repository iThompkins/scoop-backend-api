module V1
  class UsersController < ApplicationController

  	def getUser
  		if current_user
  			render json: current_user
  		end
  	end

  	def updateLocation
  		current_user.lat = params[:where][:lat]
  		current_user.long = params[:where][:long]
  		if current_user.save
  			where = {
    			"latitude" => current_user.lat,
    			"longitude" => current_user.long
    		}
  			puts where.to_json
  			render json: where.to_json
  		end
  	end

  end
end
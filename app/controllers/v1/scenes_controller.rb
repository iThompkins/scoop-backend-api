module V1
	class ScenesController < ApplicationController

		def getUsers
			deltaPosLat = current_user.lat - 0.001
			deltaNegLat = current_user.lat + 0.001
			deltaPosLong = current_user.long - 0.001
			deltaNegLong = current_user.long + 0.001
			users = User.where('lat >= ? and lat <= ? or long >= ? and long <= ?',
													deltaPosLat,
													deltaNegLat,
													deltaPosLong,
													deltaNegLong
												)
			render json: users
		end

		def create
			scene = current_user.scenes.build(
																				lat: params[:lat],
																				long: params[:long],
																				desc: params[:desc],
																				address: params[:address],
																				host: params[:host],
																				type: params[:type]
																				)
			if scene.save
				render json: Scene.all
			else 
      	render json: {error: t('scene_controller.cant_save_scene')}, status: :unprocessable_entity
			end
		end

		def index
			render json: Scene.all
		end 
	end
end
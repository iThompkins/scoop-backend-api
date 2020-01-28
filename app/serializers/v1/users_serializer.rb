module V1
  class SessionSerializer < ActiveModel::Serializer

    attributes :where

    def where
    	where = {
    		"latitude" => object.lat,
    		"longitude" => object.long
    	}
    	return where.to_json
    end

  end
end
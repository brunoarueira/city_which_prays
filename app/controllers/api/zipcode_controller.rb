module Api
  class ZipcodeController < ApplicationController
    def search
      result = AddressLookup.find(zipcode_params[:value])

      respond_to do |format|
        if result.any?
          format.json { render json: result, status: :ok }
        else
          format.json { render json: [], status: :not_found }
        end
      end
    end

    protected

    def zipcode_params
      params.permit(:value)
    end
  end
end

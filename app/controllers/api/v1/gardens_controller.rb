module Api
    module V1
      class GardensController < ApplicationController
        # Ensure only authenticated users can access these endpoints:
  
        # GET /api/v1/gardens
        def index
          gardens = Garden.all
          render json: gardens
        end
  
        # GET /api/v1/gardens/:id
        def show
          garden = Garden.find(params[:id])
          render json: garden
        end
  
        # Additional actions (create, update, destroy) can be added here
      end
    end
  end
  
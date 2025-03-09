module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!

      # GET /api/v1/current_user
      def current
        render json: { user: current_user }
      end
    end
  end
end

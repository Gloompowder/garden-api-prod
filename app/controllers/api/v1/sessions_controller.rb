module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json

      # POST /api/v1/login
      def create
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        render json: { message: 'Logged in successfully', user: resource }
      end

      # DELETE /api/v1/logout
      def destroy
        sign_out(resource_name)
        render json: { message: 'Logged out successfully' }
      end

      def current
        render json: { user: current_user }
      end

      private

      # Optionally override this method if you need to customize response on logout.
      def respond_to_on_destroy
        head :no_content
      end
    end
  end
end

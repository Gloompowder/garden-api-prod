module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      # Optionally, override create to customize your JSON response
      def create
        build_resource(sign_up_params)

        resource.save
        yield resource if block_given?
        if resource.persisted?
          if resource.active_for_authentication?
            render json: { message: 'Signed up successfully.', user: resource }, status: :ok
          else
            expire_data_after_sign_in!
            render json: { message: 'Signed up successfully. However, your account is inactive.' }, status: :ok
          end
        else
          clean_up_passwords resource
          set_minimum_password_length
          render json: { message: 'Sign up failed.', errors: resource.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
end

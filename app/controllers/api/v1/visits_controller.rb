module Api
    module V1
      class VisitsController < ApplicationController
        # Ensure user is logged in
        before_action :authenticate_user!
        # Load the visit for show, update, and destroy actions
        before_action :set_visit, only: [:show, :update, :destroy]
  
        # GET /api/v1/visits
        def index
          # Only show visits belonging to the current user
          visits = current_user.visits
          render json: visits
        end
  
        # GET /api/v1/visits/:id
        def show
          render json: @visit
        end
  
        # POST /api/v1/visits
        def create
          # Build the visit associated with the current user.
          @visit = current_user.visits.new(visit_params)
          if @visit.save
            render json: @visit, status: :created
          else
            render json: { errors: @visit.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        # PATCH/PUT /api/v1/visits/:id
        def update
          if @visit.update(visit_params)
            render json: @visit, status: :ok
          else
            render json: { errors: @visit.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/visits/:id
        def destroy
          @visit.destroy
          head :no_content
        end
  
        private
  
        # Only allow visits that belong to the current user.
        def set_visit
          @visit = current_user.visits.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Visit not found or not authorized' }, status: :not_found
        end
  
        # Define the permitted parameters for a visit.
        def visit_params
          # Do NOT permit :user_id; it's automatically assigned via current_user.
          params.require(:visit).permit(
            :lastupdate, :scheduled_start, :scheduled_end, :time_in,
            :time_out, :actual_arrival, :actual_departure, :event_description,
            :event_title, :scheduled_at, :duration, :end_time, :garden_id
          )
        end
      end
    end
  end
  
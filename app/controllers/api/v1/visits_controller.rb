module Api
    module V1
      class VisitsController < ApplicationController
        before_action :authenticate_user!
        before_action :set_visit, only: [:show, :update, :destroy]

        def index
          @visits = current_user.visits.includes(:garden)
          render json: @visits, include: :garden
        end        

        def show
          render json: @visit
        end
  
        def create
          @visit = current_user.visits.new(visit_params)
          if @visit.save
            render json: @visit, status: :created
          else
            render json: { errors: @visit.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def update
          if @visit.update(visit_params)
            render json: @visit, status: :ok
          else
            render json: { errors: @visit.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def destroy
          @visit.destroy
          head :no_content
        end
  
        private
  
        def set_visit
          @visit = current_user.visits.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Visit not found or not authorized' }, status: :not_found
        end
  
        def visit_params
          params.require(:visit).permit(
            :lastupdate, :scheduled_start, :scheduled_end, :time_in,
            :time_out, :actual_arrival, :actual_departure, :event_description,
            :event_title, :scheduled_at, :duration, :end_time, :garden_id
          )
        end
      end
    end
  end
  
module V1
  class PointOfInterestsController < ApplicationController
    before_action :set_point_of_interest, only: [:show, :update, :destroy]
    before_action :authenticate
    # GET /point_of_interests
    # GET /point_of_interests.json
    def index
      @point_of_interests = PointOfInterest.where(company_id: find_owner_company_id)

      render json: @point_of_interests
    end

    # GET /point_of_interests/1
    # GET /point_of_interests/1.json
    def show
      if @point_of_interest.company.id != find_owner_company_id
        head :unauthorized
      else
        render json: @point_of_interest
      end
    end

    # POST /point_of_interests
    # POST /point_of_interests.json
    def create
      @point_of_interest = PointOfInterest.new(point_of_interest_params)

      if @point_of_interest.save
        render json: @point_of_interest, status: :created
      else
        render json: @point_of_interest.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /point_of_interests/1
    # PATCH/PUT /point_of_interests/1.json
    def update
      @point_of_interest = PointOfInterest.find(params[:id])

      if @point_of_interest.update(point_of_interest_params)
        head :no_content
      else
        render json: @point_of_interest.errors, status: :unprocessable_entity
      end
    end

    # DELETE /point_of_interests/1
    # DELETE /point_of_interests/1.json
    def destroy
      @point_of_interest.destroy

      head :no_content
    end

    private
      def find_owner_company_id
        Session.where(session_key: extract_session_key).first.user.company.id
      end
      def extract_session_key
        request.headers[:authorization].split('=')[1]
      end

      def set_point_of_interest
        @point_of_interest = PointOfInterest.find(params[:id])
      end

      def point_of_interest_params
        params.require(:point_of_interest).permit(:name, :description, :date_added, :lat, :lng, :company_id)
      end
  end
end
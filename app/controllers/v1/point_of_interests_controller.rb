module V1
  class PointOfInterestsController < ApplicationController
    before_action :set_point_of_interest, only: [:show, :update, :destroy, :start_tracking, :stop_tracking, :track]
    before_action :authenticate
    # GET /point_of_interests
    # GET /point_of_interests.json
    def index
      @point_of_interests = PointOfInterest.where(company_id: find_owner_company_id)

      render json: @point_of_interests, root: 'pois'
    end

    # GET /point_of_interests/1
    # GET /point_of_interests/1.json
    def show
      if @point_of_interest.company.id != find_owner_company_id
        head :unauthorized
      else
        render json: @point_of_interest, root: 'poi'
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

    def start_tracking
      position_increment = 0.001
      if @point_of_interest.tracking
        render json: { error: 'Point is already being tracked.' }, status: :unprocessable_entity
      else
        point = Point.create(lat: @point_of_interest.lat, lng: @point_of_interest.lng + position_increment)
        @point_of_interest.update(point: point, tracking: true)
        head :no_content
      end
    end

    def stop_tracking
      if !@point_of_interest.tracking
        render json: { error: 'Point is not being tracked' }, status: :unprocessable_entity 
      else
        point = @point_of_interest.point
        point.destroy
        @point_of_interest.update(point: nil, tracking: false)
        head :no_content
      end
    end

    def track
      if !@point_of_interest.tracking
        render json: { error: 'Point is not being tracked' }, status: :unprocessable_entity
      else
        step = get_step
        @point_of_interest.lng += step
        render json: @point_of_interest, root: 'poi'

        if (step > 0 && @point_of_interest.lng > @point_of_interest.point.lng) || (step < 0 && @point_of_interest.lng < @point_of_interest.point.lng)
          reverse_tracking
        end
      end
    end

    private
      def get_step
        position_increment = 0.01
        if DateTime.current.second % 5 
          step = (position_increment / 30.0) * (DateTime.current.second % 30) 
          step = -step if (@point_of_interest.point.lng < @point_of_interest.lng)      
        else
          step = 0
        end
        step
      end

      def reverse_tracking
        poi = @point_of_interest
        set_point_of_interest

        @point_of_interest.point.lng = @point_of_interest.lng
        @point_of_interest.point.lat = @point_of_interest.lat

        @point_of_interest.lng = poi.lng
        @point_of_interest.lat = poi.lat

        @point_of_interest.save
        @point_of_interest.point.save
      end

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
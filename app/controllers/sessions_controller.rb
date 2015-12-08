module Api
  class SessionsController < ApplicationController
    before_action :set_session, only: [:show, :update, :destroy]

    # GET /sessions
    # GET /sessions.json
    def index
      @sessions = Session.all

      render json: @sessions
    end

    # GET /sessions/1
    # GET /sessions/1.json
    def show
      render json: @session
    end

    # POST /sessions
    # POST /sessions.json
    def create
      @session = Session.new(session_params)

      if @session.save
        render json: @session, status: :created, location: @session
      else
        render json: @session.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /sessions/1
    # PATCH/PUT /sessions/1.json
    def update
      @session = Session.find(params[:id])

      if @session.update(session_params)
        head :no_content
      else
        render json: @session.errors, status: :unprocessable_entity
      end
    end

    # DELETE /sessions/1
    # DELETE /sessions/1.json
    def destroy
      @session.destroy

      head :no_content
    end

    private

      def set_session
        @session = Session.find(params[:id])
      end

      def session_params
        params.require(:session).permit(:session_key, :expiration_date)
      end
  end
end
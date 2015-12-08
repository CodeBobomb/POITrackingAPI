module Api
  class TrackingDevicesController < ApplicationController
    before_action :set_tracking_device, only: [:show, :update, :destroy]

    # GET /tracking_devices
    # GET /tracking_devices.json
    def index
      @tracking_devices = TrackingDevice.all

      render json: @tracking_devices
    end

    # GET /tracking_devices/1
    # GET /tracking_devices/1.json
    def show
      render json: @tracking_device
    end

    # POST /tracking_devices
    # POST /tracking_devices.json
    def create
      @tracking_device = TrackingDevice.new(tracking_device_params)

      if @tracking_device.save
        render json: @tracking_device, status: :created, location: @tracking_device
      else
        render json: @tracking_device.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tracking_devices/1
    # PATCH/PUT /tracking_devices/1.json
    def update
      @tracking_device = TrackingDevice.find(params[:id])

      if @tracking_device.update(tracking_device_params)
        head :no_content
      else
        render json: @tracking_device.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tracking_devices/1
    # DELETE /tracking_devices/1.json
    def destroy
      @tracking_device.destroy

      head :no_content
    end

    private

      def set_tracking_device
        @tracking_device = TrackingDevice.find(params[:id])
      end

      def tracking_device_params
        params.require(:tracking_device).permit(:device_name, :device_type)
      end
  end
end
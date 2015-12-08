module V1
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    before_action :authenticate_login, only: :login
    before_action :authenticate, except: :login

    # GET /users
    # GET /users.json
    def index
      @users = User.all

      render json: @users
    end

    def login 
      credentials = get_login_credentials
      puts credentials
      @user = User.find_by(username: credentials[0])
      #get_new_session_key if @user.session.expiration_date < Date.current

      render json: { session_key: @user.session.session_key }, status: 200
    end

    # GET /users/1
    # GET /users/1.json
    def show
      render json: @user
    end

    # POST /users
    # POST /users.json
    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        head :no_content
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
      @user.destroy

      head :no_content
    end

    private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:username, :password, :date_of_birth, :email, :first_name, :last_name)
      end

      def get_login_credentials
        require 'base64'
        encoded_part = request.headers['Authorization']

        Base64.decode64(request.headers['Authorization'].split(' ')[1]).split(':')
      end

      def get_new_session_key
        @user.session.set_session_key
        @user.session.set_expiration_date
      end
  end
end
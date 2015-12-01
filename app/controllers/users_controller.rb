class UsersController < ApplicationController
  include ActionController::Serialization
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate, except: [:get_session_key]


  def get_session_key
    user = nil
    if request.headers[:username].nil? || request.headers[:password].nil?
      render :json => { error: MISSING_PARAMS }, :status => 422
      puts "HERE"
    else
      user = User.find_by(username: request.headers[:username], password: request.headers[:password])
      if user.nil?
        render :json => { error: USER_NOT_FOUND }, status => 422
      else
        if user.session.expiration_date < Date.current
          Session.destroy(user.session)
          user.session=Session.create
        end
        render :json => { session_key: user.session.session_key} 
      end
    end
    
  end
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    render json: @users, root: false
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
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :date_of_birth, :auth_token)
    end
end

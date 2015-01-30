class UsersController < ApplicationController
  before_action :authenticate_user, only: :show
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :xml
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def api
    @user = User.authenticate(params[:email], params[:password])
    respond_to do |format|
      if @user
        format.json{render :show, status: :ok, location: @user}
      else
        format.json { render json: @user.errors, status: :unauthorized }
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if params.has_key?(:roles)
      @user.roles=[params[:roles]]
    else
      @user.roles=:student
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if current_user
      session[params[:user_id]] = nil
    end
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def authenticate_user

    if params.has_key?(:api_key)
      @api_key = ApiKey.find_by_key(params[:api_key])
      if(@api_key)
        return true
      end
    end

    if current_user
      return true
    end
    error = {'error'=>'not authenticated'}.to_json
    render :json => error, status: :not_authorized
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :game_id, :password, :password_confirmation, :isAdmin, :roles)
    end
end

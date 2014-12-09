class SessionsController < ApplicationController
  skip_before_action :current_user
  respond_to :json, :xml, :html
  def new

  end
  def create
#try to authenticate the user - if they authenticate successfully, an instance of the User model is returned
    @user = User.authenticate(params[:email], params[:password])
#if an instance is returned and @user is not nil...
    if @user
      @user.destroy_api_key
      ApiKey.new.add_key(@user)
#let the user know they've been logged in with a flash message
      respond_to do |format|

          format.html { redirect_to @user, notice: 'You have successfully logged in.' }
          format.json { render :show, status: :created, location: @user }
        end
#THIS IS THE MOST IMPORTANT PART. Actually log the user in by storing their ID in the session hash with the [:user_id] key!
      session[:user_id] = @user.id
#then redirect them to the homepage
#      redirect_to "/"
    else
#whoops, either the user wasn't in the database or their password is incorrect, so let them know, then redirect them back to the log in page
      respond_to do |format|
        error = {'error'=>"You aren't registered!"}.to_json
        format.json { render json: error, status: :unauthorized }
        format.html { redirect_to log_in_path, notice: 'There was a problem logging you in.' }

      end
    end
  end

  def destroy
    id = session[:user_id]
    if params.has_key?(:api_key)
      ApiKey.find_by_key(params[:api_key]).delete
      respond_to do |format|
        format.json { head :no_content }
      end
      return true
    else
      error = {'error'=>'Already Logged Out!'}.to_json
      render :json => error, status: :already_reported
    end
    session[:user_id] = nil
    ApiKey.find_by_user_id(id).delete
    redirect_to "/"
  end

end

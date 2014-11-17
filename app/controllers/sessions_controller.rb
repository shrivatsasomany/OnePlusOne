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
      ApiKey.new.add_key(@user)
#let the user know they've been logged in with a flash message
      respond_to do |format|
        if @user
          format.html { redirect_to @user, notice: 'You have successfully logged in.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render "new" }
          format.json { render json: @user.errors, status: :unauthorized }
        end
      end
#THIS IS THE MOST IMPORTANT PART. Actually log the user in by storing their ID in the session hash with the [:user_id] key!
      session[:user_id] = @user.id
#then redirect them to the homepage
#      redirect_to "/"
    else
#whoops, either the user wasn't in the database or their password is incorrect, so let them know, then redirect them back to the log in page
      flash[:alert] = "There was a problem logging you in."
      redirect_to log_in_path
    end
  end

  def destroy
    id = session[:user_id]
    if params.has_key?(:api_key)
      ApiKey.find_by_key(params[:api_key]).delete
      return true
    end
    session[:user_id] = nil
    ApiKey.find_by_user_id(id).delete
    redirect_to "/"
  end

end

class AnswersController < ApplicationController
  before_action :authenticate_user
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html
  def index
    @answers = Answer.all
    if params.has_key?(:user_id)
      @id = params[:user_id]
      @answers = Answer.where(:user_id => @id)
    elsif params.has_key?(:question_id)
      @answers = Answer.where(:question_id => params[:question_id])
    elsif params.has_key?(:quantifier)
      @answers = Answer.where(:quantifier => params[:quantifier])
    elsif params.has_key?(:question_id) && params.has_key?(:quantifier)
      @answers = Answer.where(:quantifier =>  params[:quantifier]) & Answer.where(:question_id => params[:question_id])
    elsif params.has_key?(:location) && params.has_key?(:quantifier)
      @location_answers =
      @answers = Answer.where(:quantifier =>  params[:quantifier]) & Answer.joins(:questions).where(:questions => {:location => params[:location]})
    end
      respond_with(@answers)
  end

  def show
    respond_with(@answer)
  end

  def new
    @answer = Answer.new
    respond_with(@answer)
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.save
    respond_with(@answer)
  end

  def update
    @answer.update(answer_params)
    respond_with(@answer)
  end

  def destroy
    @answer.destroy
    respond_with(@answer)
  end

  private

  def authenticate_admin
    if params.has_key?(:api_key)
      @user = ApiKey.find_by_key(params[:api_key]).user
      if (@user) && (@user.isAdmin?)
        return true
      end
    else
      if (current_user) && (current_user.isAdmin?)
        return true
      end
    end
    error = {'error'=>'not authenticated'}.to_json
    render :json => error, status: :not_authorized
  end

  def authenticate_user
    if params.has_key?(:api_key)
      @user = ApiKey.find_by_key(params[:api_key]).user
      if @user
        return true
      end
    else
      if current_user
        return true
      end
    end
    error = {'error'=>'not authenticated'}.to_json
    render :json => error, status: :not_authorized
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:answer_text, :user_id, :question_id, :quantifier)
  end
end

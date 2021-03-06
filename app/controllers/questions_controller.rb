class QuestionsController < ApplicationController
  before_action :authenticate_user, only: [:index]
  before_action :authenticate_admin, except: [:show, :index]
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :xml
  def index
    @questions = Question.all
    if params.has_key?(:qtype)
      @questions = Question.where(:question_type => params[:qtype])
    end
    respond_with(@questions)
  end

  def show
    respond_with(@question)
  end

  def new
    @question = Question.new
    respond_with(@question)
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    #@question.save
    #respond_with(@question)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @question.update(question_params)
    respond_with(@question)
  end

  def destroy
    @question.destroy
    respond_with(@question)
  end

  private

  def authenticate_admin

    if params.has_key?(:api_key)
      @user = ApiKey.find_by_key(params[:api_key]).user
      if @user && @user.isAdmin?
        return true
      end
    else
      return true if current_user.isAdmin?
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

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question_text, :description, :location, :picture, :question_type, :game_id, :is_quantifier)
  end

end

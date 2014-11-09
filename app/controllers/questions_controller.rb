class QuestionsController < ApplicationController
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
    respond_to do |format|
      format.html # index.html.erb
      format.json do
        render json: @question.to_json
      end
    end
  end

  def new
    @question = Question.new
    respond_with(@question)
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.save
    respond_with(@question)
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
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:question_text, :description, :location, :picture, :question_type, :game_id)
    end

end
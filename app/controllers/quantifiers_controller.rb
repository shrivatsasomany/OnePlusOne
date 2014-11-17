class QuantifiersController < ApplicationController
  before_action :set_quantifier, only: [:show, :edit, :update, :destroy]

  # GET /quantifiers
  # GET /quantifiers.json
  def index
    @quantifiers = Quantifier.all
  end

  # GET /quantifiers/1
  # GET /quantifiers/1.json
  def show
  end

  # GET /quantifiers/new
  def new
    @quantifier = Quantifier.new
  end

  # GET /quantifiers/1/edit
  def edit
  end

  # POST /quantifiers
  # POST /quantifiers.json
  def create
    @quantifier = Quantifier.new(quantifier_params)

    respond_to do |format|
      if @quantifier.save
        format.html { redirect_to @quantifier, notice: 'Quantifier was successfully created.' }
        format.json { render :show, status: :created, location: @quantifier }
      else
        format.html { render :new }
        format.json { render json: @quantifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quantifiers/1
  # PATCH/PUT /quantifiers/1.json
  def update
    respond_to do |format|
      if @quantifier.update(quantifier_params)
        format.html { redirect_to @quantifier, notice: 'Quantifier was successfully updated.' }
        format.json { render :show, status: :ok, location: @quantifier }
      else
        format.html { render :edit }
        format.json { render json: @quantifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quantifiers/1
  # DELETE /quantifiers/1.json
  def destroy
    @quantifier.destroy
    respond_to do |format|
      format.html { redirect_to quantifiers_url, notice: 'Quantifier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quantifier
      @quantifier = Quantifier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quantifier_params
      params.require(:quantifier).permit(:text)
    end
end

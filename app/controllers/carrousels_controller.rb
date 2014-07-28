class CarrouselsController < ApplicationController
  before_action :set_carrousel, only: [:show, :edit, :update, :destroy]

  # GET /carrousels
  # GET /carrousels.json
  def index
    @carrousels = Carrousel.all
  end

  # GET /carrousels/1
  # GET /carrousels/1.json
  def show
  end

  # GET /carrousels/new
  def new
    @carrousel = Carrousel.new
  end

  # GET /carrousels/1/edit
  def edit
  end

  # POST /carrousels
  # POST /carrousels.json
  def create
    @carrousel = Carrousel.new(carrousel_params)

    respond_to do |format|
      if @carrousel.save
        format.html { redirect_to @carrousel, notice: 'Carrousel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @carrousel }
      else
        format.html { render action: 'new' }
        format.json { render json: @carrousel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carrousels/1
  # PATCH/PUT /carrousels/1.json
  def update
    respond_to do |format|
      if @carrousel.update(carrousel_params)
        format.html { redirect_to @carrousel, notice: 'Carrousel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @carrousel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carrousels/1
  # DELETE /carrousels/1.json
  def destroy
    @carrousel.destroy
    respond_to do |format|
      format.html { redirect_to carrousels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrousel
      @carrousel = Carrousel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carrousel_params
      params[:carrousel]
    end
end

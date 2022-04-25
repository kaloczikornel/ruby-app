class WinesController < ApplicationController
  before_action :set_wine, only: %i[ show edit update destroy]

  def index
    #@wines = Wine.all
    @w1 = Wine.new name: "Kadarka", wineType: "Red", vintage: 2019, id: 1
    @w2 = Wine.new name: "Olaszrizling", wineType: "White", vintage: 2018, id: 2
    @w3 = Wine.new name: "Merlot", wineType: "Rosé", vintage: 2022, id: 3
    @wines = [ @w1, @w2, @w3 ]
  end
  # GET /wines/1 or /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    wine = Wine.new
  end

  # GET /wines/1/edit
  def edit
  end

  # POST /wines or /wines.json
  def create
    wine = Wine.new(wine_params)

    respond_to do |format|
      if wine.save
        format.html { redirect_to wine_url(wine), notice: "Wine was successfully created." }
        format.json { render :show, status: :created, location: wine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1 or /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to wine_url(@wine), notice: "Wine was successfully updated." }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1 or /wines/1.json
  def destroy
    @wine.destroy

    respond_to do |format|
      format.html { redirect_to wines_url, notice: "Wine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_wine
    #wine = Wine.find(params[:id])
    @wine = Wine.new name: 'Kadarka', wineType: "Red", vintage: 2017, id: 1
  end

  # Only allow a list of trusted parameters through.
  def wine_params
    params.require(:wine).permit(:name, :wineType)
  end

end

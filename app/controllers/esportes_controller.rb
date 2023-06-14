class EsportesController < ApplicationController
  before_action :set_esporte, only: %i[ show edit update destroy ]

  # GET /esportes or /esportes.json
  def index
    @esportes = Esporte.all
  end

  # GET /esportes/1 or /esportes/1.json
  def show
  end

  # GET /esportes/new
  def new
    @esporte = Esporte.new
  end

  # GET /esportes/1/edit
  def edit
  end

  # POST /esportes or /esportes.json
  def create
    @esporte = Esporte.new(esporte_params)

    respond_to do |format|
      if @esporte.save
        format.html { redirect_to esporte_url(@esporte), notice: "Esporte was successfully created." }
        format.json { render :show, status: :created, location: @esporte }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @esporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /esportes/1 or /esportes/1.json
  def update
    respond_to do |format|
      if @esporte.update(esporte_params)
        format.html { redirect_to esporte_url(@esporte), notice: "Esporte was successfully updated." }
        format.json { render :show, status: :ok, location: @esporte }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @esporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esportes/1 or /esportes/1.json
  def destroy
    @esporte.destroy

    respond_to do |format|
      format.html { redirect_to esportes_url, notice: "Esporte was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_esporte
      @esporte = Esporte.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def esporte_params
      params.require(:esporte).permit(:nome)
    end
end

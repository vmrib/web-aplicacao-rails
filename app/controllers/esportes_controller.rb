class EsportesController < ApplicationController
  before_action :set_esporte, only: %i[ show edit update destroy ]

  # GET /esportes or /esportes.json
  def index
    @esportes = Esporte.all
  end

  # GET /esportes/1 or /esportes/1.json
  def show
    render layout: false
  end

  # GET /esportes/new
  def new
    if not helpers.isAdmin?
      return
    end
    @esporte = Esporte.new
    render layout: false
  end

  # GET /esportes/1/edit
  def edit
    if not helpers.isAdmin?
      return
    end
    render layout: false
  end

  # POST /esportes or /esportes.json
  def create
    if not helpers.isAdmin?
      return
    end
    @esporte = Esporte.new(esporte_params)

    respond_to do |format|
      if @esporte.save
        format.html { redirect_to esportes_url, notice: "Esporte criado com sucesso." }
        format.json { render :show, status: :created, location: @esporte }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @esporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /esportes/1 or /esportes/1.json
  def update
    if not helpers.isAdmin?
      return
    end
    respond_to do |format|
      if @esporte.update(esporte_params)
        format.html { redirect_to esportes_url, notice: "Esporte atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @esporte }
      else
        format.html { redirect_to esportes_url, alert: "Erro ao atualizar esporte.", status: :unprocessable_entity }
        format.json { render json: @esporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esportes/1 or /esportes/1.json
  def destroy
    if not helpers.isAdmin?
      return
    end
    @esporte.destroy

    respond_to do |format|
      format.html { redirect_to esportes_url, notice: "Esporte excluído com sucesso." }
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

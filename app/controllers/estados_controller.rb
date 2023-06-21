class EstadosController < ApplicationController
  before_action :set_estado, only: %i[ show edit update destroy ]

  # GET /estados or /estados.json
  def index
    @estados = Estado.all
  end

  # GET /estados/1 or /estados/1.json
  def show
    render layout: false
  end

  # GET /estados/new
  def new
    if not helpers.isAdmin?
      return
    end
    @estado = Estado.new
    render layout: false
  end

  # GET /estados/1/edit
  def edit
    if not helpers.isAdmin?
      return
    end
    render layout: false
  end

  # POST /estados or /estados.json
  def create
    if not helpers.isAdmin?
      return
    end
    @estado = Estado.new(estado_params)

    respond_to do |format|
      if @estado.save
        format.html { redirect_to estados_url, notice: "Estado criado com sucesso." }
        format.json { render :show, status: :created, location: @estado }
      else
        format.html { redirect_to estados_url, alert: "Erro ao criar o estado", status: :unprocessable_entity }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estados/1 or /estados/1.json
  def update
    if not helpers.isAdmin?
      return
    end
    respond_to do |format|
      if @estado.update(estado_params)
        format.html { redirect_to estados_url, notice: "Estado atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @estado }
      else
        format.html { redirect_to estados_url, alert: "Erro ao atualizar o estado", status: :unprocessable_entity }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estados/1 or /estados/1.json
  def destroy
    if not helpers.isAdmin?
      return
    end
    @estado.destroy

    respond_to do |format|
      format.html { redirect_to estados_url, notice: "Estado was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado
      @estado = Estado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estado_params
      params.require(:estado).permit(:sigla, :nome)
    end
end

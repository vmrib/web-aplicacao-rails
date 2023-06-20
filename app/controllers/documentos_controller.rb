class DocumentosController < ApplicationController
  before_action :set_documento, only: %i[ show edit update destroy ]

  # GET /documentos or /documentos.json
  def index
    @documentos = Documento.all
  end

  # GET /documentos/1 or /documentos/1.json
  def show
    render layout: false
  end

  # GET /documentos/new
  def new
    if not helpers.isAdmin?
      return
    end
    @documento = Documento.new
    render layout: false
  end

  # GET /documentos/1/edit
  def edit
    if not helpers.isAdmin?
      return
    end
    render layout: false
  end

  # POST /documentos or /documentos.json
  def create
    if not helpers.isAdmin?
      return
    end
    @documento = Documento.new(documento_params)

    respond_to do |format|
      if @documento.save
        format.html { redirect_to documentos_url, notice: "Documento was successfully created." }
        format.json { render :show, status: :created, location: @documento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentos/1 or /documentos/1.json
  def update
    if not helpers.isAdmin?
      return
    end
    respond_to do |format|
      if @documento.update(documento_params)
        format.html { redirect_to documentos_url, notice: "Documento atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @documento }
      else
        format.html { redirect_to documentos_url, alert: "Erro ao atualizar o documento", status: :unprocessable_entity }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1 or /documentos/1.json
  def destroy
    if not helpers.isAdmin?
      return
    end
    @documento.destroy

    respond_to do |format|
      format.html { redirect_to documentos_url, notice: "Documento excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def documento_params
      params.require(:documento).permit(:rg, :cpf, :pessoa_id)
    end
end

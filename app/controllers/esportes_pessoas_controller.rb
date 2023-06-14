class EsportesPessoasController < ApplicationController
  before_action :set_esportes_pessoa, only: %i[ show edit update destroy ]

  # GET /esportes_pessoas or /esportes_pessoas.json
  def index
    @esportes_pessoas = EsportesPessoa.all
  end

  # GET /esportes_pessoas/1 or /esportes_pessoas/1.json
  def show
  end

  # GET /esportes_pessoas/new
  def new
    @esportes_pessoa = EsportesPessoa.new
  end

  # GET /esportes_pessoas/1/edit
  def edit
  end

  # POST /esportes_pessoas or /esportes_pessoas.json
  def create
    @esportes_pessoa = EsportesPessoa.new(esportes_pessoa_params)

    respond_to do |format|
      if @esportes_pessoa.save
        format.html { redirect_to esportes_pessoa_url(@esportes_pessoa), notice: "Esportes pessoa was successfully created." }
        format.json { render :show, status: :created, location: @esportes_pessoa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @esportes_pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /esportes_pessoas/1 or /esportes_pessoas/1.json
  def update
    respond_to do |format|
      if @esportes_pessoa.update(esportes_pessoa_params)
        format.html { redirect_to esportes_pessoa_url(@esportes_pessoa), notice: "Esportes pessoa was successfully updated." }
        format.json { render :show, status: :ok, location: @esportes_pessoa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @esportes_pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esportes_pessoas/1 or /esportes_pessoas/1.json
  def destroy
    @esportes_pessoa.destroy

    respond_to do |format|
      format.html { redirect_to esportes_pessoas_url, notice: "Esportes pessoa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_esportes_pessoa
      @esportes_pessoa = EsportesPessoa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def esportes_pessoa_params
      params.require(:esportes_pessoa).permit(:esporte_id, :pessoa_id)
    end
end

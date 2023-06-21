class EsportesPessoasController < ApplicationController
  before_action :set_esportes_pessoa, only: %i[ show edit update destroy ]

  # GET /esportes_pessoas or /esportes_pessoas.json
  def index
    @esportes_pessoas = EsportesPessoa.all
  end

  # GET /esportes_pessoas/1 or /esportes_pessoas/1.json
  def show
    render layout: false
  end

  # GET /esportes_pessoas/new
  def new
    if not helpers.isAdmin?
      return
    end
    @esportes_pessoa = EsportesPessoa.new
    render layout: false
  end

  # GET /esportes_pessoas/1/edit
  def edit
    if not helpers.isAdmin?
      return
    end
    render layout: false
  end

  # POST /esportes_pessoas or /esportes_pessoas.json
  def create
    if not helpers.isAdmin?
      return
    end
    @esportes_pessoa = EsportesPessoa.new(esportes_pessoa_params)

    respond_to do |format|
      if @esportes_pessoa.save
        format.html { redirect_to esportes_pessoas_url, notice: "EsportesPessoa criado com sucesso." }
        format.json { render :show, status: :created, location: @esportes_pessoa }
      else
        format.html { redirect_to esportes_pessoas_url, alert: "Erro ao criar esportesPessoa", status: :unprocessable_entity }
        format.json { render json: @esportes_pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /esportes_pessoas/1 or /esportes_pessoas/1.json
  def update
    if not helpers.isAdmin?
      return
    end
    respond_to do |format|
      if @esportes_pessoa.update(esportes_pessoa_params)
        format.html { redirect_to esportes_pessoas_url, notice: "EsportesPessoa atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @esportes_pessoa }
      else
        format.html { redirect_to esportes_pessoas_url, alert: "Erro ao atualizar esportesPessoa", status: :unprocessable_entity }
        format.json { render json: @esportes_pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esportes_pessoas/1 or /esportes_pessoas/1.json
  def destroy
    if not helpers.isAdmin?
      return
    end
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

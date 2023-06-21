class PessoasController < ApplicationController
  before_action :set_pessoa, only: %i[ show edit update destroy ]

  # GET /pessoas or /pessoas.json
  def index
    @pessoas = Pessoa.all
  end

  # GET /pessoas/1 or /pessoas/1.json
  def show
    render layout: false
  end

  # GET /pessoas/new
  def new
    if not helpers.isAdmin?
      return
    end
    @pessoa = Pessoa.new
    render layout: false
  end

  # GET /pessoas/1/edit
  def edit
    if not helpers.isAdmin?
      return
    end
    render layout: false
  end

  # POST /pessoas or /pessoas.json
  def create
    if not helpers.isAdmin?
      return
    end
    @pessoa = Pessoa.new(pessoa_params)

    respond_to do |format|
      if @pessoa.save
        format.html { redirect_to pessoas_url, notice: "Pessoa criada com sucesso." }
        format.json { render :show, status: :created, location: @pessoa }
      else
        format.html { redirect_to pessoas_url, alert: "Erro ao criar a pessoa", status: :unprocessable_entity }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pessoas/1 or /pessoas/1.json
  def update
    if not helpers.isAdmin?
      return
    end
    respond_to do |format|
      if @pessoa.update(pessoa_params)
        format.html { redirect_to pessoas_url, notice: "Pessoa atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @pessoa }
      else
        format.html { redirect_to pessoas_url, alert: "Erro ao atualizar a pessoa", status: :unprocessable_entity }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas/1 or /pessoas/1.json
  def destroy
    if not helpers.isAdmin?
      return
    end
    @pessoa.destroy

    respond_to do |format|
      format.html { redirect_to pessoas_url, notice: "Pessoa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = Pessoa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pessoa_params
      params.require(:pessoa).permit(:sobrenome, :nome, :estado_id)
    end
end

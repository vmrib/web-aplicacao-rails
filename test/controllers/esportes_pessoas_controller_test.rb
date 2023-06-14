require "test_helper"

class EsportesPessoasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @esportes_pessoa = esportes_pessoas(:one)
  end

  test "should get index" do
    get esportes_pessoas_url
    assert_response :success
  end

  test "should get new" do
    get new_esportes_pessoa_url
    assert_response :success
  end

  test "should create esportes_pessoa" do
    assert_difference("EsportesPessoa.count") do
      post esportes_pessoas_url, params: { esportes_pessoa: { esporte_id: @esportes_pessoa.esporte_id, pessoa_id: @esportes_pessoa.pessoa_id } }
    end

    assert_redirected_to esportes_pessoa_url(EsportesPessoa.last)
  end

  test "should show esportes_pessoa" do
    get esportes_pessoa_url(@esportes_pessoa)
    assert_response :success
  end

  test "should get edit" do
    get edit_esportes_pessoa_url(@esportes_pessoa)
    assert_response :success
  end

  test "should update esportes_pessoa" do
    patch esportes_pessoa_url(@esportes_pessoa), params: { esportes_pessoa: { esporte_id: @esportes_pessoa.esporte_id, pessoa_id: @esportes_pessoa.pessoa_id } }
    assert_redirected_to esportes_pessoa_url(@esportes_pessoa)
  end

  test "should destroy esportes_pessoa" do
    assert_difference("EsportesPessoa.count", -1) do
      delete esportes_pessoa_url(@esportes_pessoa)
    end

    assert_redirected_to esportes_pessoas_url
  end
end

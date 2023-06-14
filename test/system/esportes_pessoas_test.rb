require "application_system_test_case"

class EsportesPessoasTest < ApplicationSystemTestCase
  setup do
    @esportes_pessoa = esportes_pessoas(:one)
  end

  test "visiting the index" do
    visit esportes_pessoas_url
    assert_selector "h1", text: "Esportes pessoas"
  end

  test "should create esportes pessoa" do
    visit esportes_pessoas_url
    click_on "New esportes pessoa"

    fill_in "Esporte", with: @esportes_pessoa.esporte_id
    fill_in "Pessoa", with: @esportes_pessoa.pessoa_id
    click_on "Create Esportes pessoa"

    assert_text "Esportes pessoa was successfully created"
    click_on "Back"
  end

  test "should update Esportes pessoa" do
    visit esportes_pessoa_url(@esportes_pessoa)
    click_on "Edit this esportes pessoa", match: :first

    fill_in "Esporte", with: @esportes_pessoa.esporte_id
    fill_in "Pessoa", with: @esportes_pessoa.pessoa_id
    click_on "Update Esportes pessoa"

    assert_text "Esportes pessoa was successfully updated"
    click_on "Back"
  end

  test "should destroy Esportes pessoa" do
    visit esportes_pessoa_url(@esportes_pessoa)
    click_on "Destroy this esportes pessoa", match: :first

    assert_text "Esportes pessoa was successfully destroyed"
  end
end

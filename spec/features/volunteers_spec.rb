require 'rails_helper'

RSpec.describe 'Volunteers' do
  scenario 'needs to register to receive gifts and distribute some' do
    visit '/'

    expect(page).to have_content 'Realize seu cadastro como voluntário'

    fill_in 'Nome', with: 'Bruno Arueira'
    fill_in 'E-mail', with: 'email@email.com'

    fill_in 'ddd_cellphone', with: '22'
    fill_in 'number_cellphone', with: '999999999'

    fill_in 'ddd_residential_phone', with: '22'
    fill_in 'number_residential_phone', with: '99999999'

    fill_in 'zipcode', with: '28021001'

    click_button 'Pesquisar'

    expect(page).to_not have_content 'Carregando...'

    expect(page).to have_field 'Logradouro', with: 'Rua Rossine Quintanilha Chagas', disabled: true
    expect(page).to have_field 'Bairro', with: 'Parque Penha', disabled: true
    expect(page).to have_field 'Cidade', with: 'Campos dos Goytacazes', disabled: true
    expect(page).to have_field 'UF', with: 'RJ', disabled: true

    fill_in 'Número', with: '2'

    check 'terms'

    find_button('Próximo').click

    expect(page).to have_content 'Residências que quero distribuir'
    expect(page).to have_content 'Residências que quero distribuir'

    check 'except_homes'

    expect(page).to have_field 'CEP', with: '28021001', disabled: true

    fill_in 'number_from_homes_to_distribute', with: '555, 580, 700'

    click_button 'Próximo'

    expect(page).to have_content 'Igreja que frequenta'

    fill_in 'Nome da igreja', with: 'Igreja Católica de São Gonçalo'
    fill_in 'CEP', with: '28110000'
    fill_in 'Logradouro', with: 'Rua de São Gonçalo'
    fill_in 'Número', with: '20'
    fill_in 'Bairro', with: 'Goytacazes'
    fill_in 'Cidade', with: 'Campos dos Goytacazes'
    fill_in 'UF', with: 'RJ'
    fill_in 'Nome do líder principal', with: 'Padre Marcelo'

    click_button 'Salvar'

    expect(page).to have_content 'Seu cadastro foi realizado com sucesso!'
  end
end

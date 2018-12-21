require 'spec_helper'
require 'json'
require './app/services/exchange_service'
 
describe 'Currency' do
  it 'exchange' do
    amount = rand(0..9999) # gerando numero aleatório
    res = ExchangeService.new("USD", "BRL", amount).perform # chamando service e o tipo de moeda que quer trocar
    expect(res.is_a? Numeric).to eql(true) # res. - resposta verifica se o tipo é numerico .to --esperasse q a resposta seja numerica true
    expect(res != 0 || amount == 0).to eql(true) # verifica se nao é zero quando a quantidade nao é zero.
  end
end
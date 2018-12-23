require 'rest-client'
require 'json'
 
class ExchangeService # quando for chamar - ExchangeService.new para chamar o initialize
  def initialize(source_currency, target_currency, amount)
    @source_currency = source_currency # a moeda que vc quer trocar por outra.
    @target_currency = target_currency # essa outra moeda, Ex: BRL 
    @amount = amount.to_f  # a quantidade que vc quer trocar.
  end
 
 
  def perform
    begin
      exchange_api_url = Rails.application.credentials[Rails.env.to_sym][:currency_api_url] #acessa as credentiais
      exchange_api_key = Rails.application.credentials[Rails.env.to_sym][:currency_api_key]
      url = "#{exchange_api_url}?token=#{exchange_api_key}&currency=#{@source_currency}/#{@target_currency}"
      res = RestClient.get url
      value = JSON.parse(res.body)['currency'][0]['value'].to_f # to_f, convertendo a resposta para parte numerica float
      
      value * @amount  # multiplicando @amount pelo valor
    rescue RestClient::ExceptionWithResponse => e # se o codigo acima tiver algum erro o e.response é chamado.
      e.response
    end
  end
end
# ajustando rota para acessar direto http:localhost:3000 
Rails.application.routes.draw do
  root 'exchanges#index'
  get 'convert', to: 'exchanges#convert' #para chamadas http://convert - chamar convert do controller exchanges
end
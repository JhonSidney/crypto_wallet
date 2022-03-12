namespace :dev do
  desc "Configura o ambiente de desenvolvimento com (:drop :create :migrate :seed)"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deletando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types) # cadastrando primeiro as minerações
      %x(rails dev:add_coins)   
    else
      puts "voce nao esta em ambiente rails de desenvolvimento!"
    end
  end

  desc "Cadastra moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [
                {
                  description: "Ethereum",
                  acronym: "ETH",
                  url_image: "https://www.comocomprarcriptomoedas.com/wp-content/uploads/2018/02/ETHEREUM-LOGO-2.png",
                  mining_type: MiningType.find_by(acronym: 'PoW') #buscando o Pow   .find = um unico elemento| find_by | .where = retorna um array
                },
                {
                  description: "Bitcoin",
                  acronym: "BTC",
                  url_image: "https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png",
                  mining_type: MiningType.all.sample #sorteando aleatoriamente da table
                },
                {
                  description: "Dash",
                  acronym: "DSH",
                  url_image: "https://thumbs.dreamstime.com/b/%C3%ADcone-de-dashcoin-o-estilo-da-ilustra%C3%A7%C3%A3o-do-vetor-%C3%A9-um-s%C3%ADmbolo-ic%C3%B4nico-liso-com-varia%C3%A7%C3%B5es-azuis-cor-projetado-para-web-e-131604966.jpg",
                  mining_type: MiningType.all.sample
                },
                {
                  description: "Iota",
                  acronym: "IOT",
                  url_image: "https://preview.free3d.com/img/2019/10/2154262020566812458/wzgdo8xh-900.jpg",
                  mining_type: MiningType.all.sample
                },
                {
                  description: "Zcash",
                  acronym: "ZEC",
                  url_image: "https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png?1547034197",
                  mining_type: MiningType.all.sample
                } 
              ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end    
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stack", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end    
    end
  end

  private
  def show_spinner(msg_start, msg_end = "Concluído")
    #https://github.com/piotrmurach/tty-spinner
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end

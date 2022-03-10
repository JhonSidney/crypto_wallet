# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Gerando Moedas ...")
spinner.auto_spin

coins = [
            {
                description: "Ethereum",
                acronym: "ETH",
                url_image: "https://www.comocomprarcriptomoedas.com/wp-content/uploads/2018/02/ETHEREUM-LOGO-2.png"
            },
            {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png"
            },
            {
            description: "Dash",
            acronym: "DSH",
            url_image: "https://thumbs.dreamstime.com/b/%C3%ADcone-de-dashcoin-o-estilo-da-ilustra%C3%A7%C3%A3o-do-vetor-%C3%A9-um-s%C3%ADmbolo-ic%C3%B4nico-liso-com-varia%C3%A7%C3%B5es-azuis-cor-projetado-para-web-e-131604966.jpg"
            }   
        ]

coins.each do |coin|

    Coin.find_or_create_by!(coin)
end

spinner.success("( Concluido!)")
sleep(4)

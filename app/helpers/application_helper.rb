module ApplicationHelper

   def locale
        I18n.locale == :en ? "Estados unidos" : "Portugues do Brasil"
    end 

    def data_br(data_us)
        data_us.strftime("%d/%m/%Y")
    end

    def application_name
       "Crypto Wallet App" 
    end

    def ambiente_rails
        if Rails.env.development?
            "Desenvolvimento"
        elsif Rails.env.production?
            " Ambinete de Produção"
        else 
            "Teste"
        end
    end
end

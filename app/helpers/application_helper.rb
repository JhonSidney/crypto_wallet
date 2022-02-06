module ApplicationHelper
    def data_br(data_us)
        data_us.strftime("%d/%m/%Y")
    end

    def application_name
       "Crypto Wallet App" 
    end
end

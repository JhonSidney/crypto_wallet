namespace :dev do
  desc "Configura o ambiente de desenvolvimento com (:drop :create :migrate :seed)"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deletando BD ...") do
        %x(rails db:drop)
      end

      show_spinner("Criando BD ...") do
        %x(rails db:create)
      end
      
      show_spinner("Migrando BD ...") do
        %x(rails db:migrate)
      end

      show_spinner("Populando BD ...") do
        %x(rails db:seed)
      end  
    else
      puts "voce nao esta em ambiente rails de desenvolvimento!"
    end

    def show_spinner(msg_start, msg_end = "concluído")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start} ")
      spinner.auto_spin
      %x(rails db:migrate)
      spinner.success("#{msg_end}")
    end
  end
end

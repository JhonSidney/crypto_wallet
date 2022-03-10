namespace :dev do
  desc "Configura o ambiente de desenvolvimento com (:drop :create :migrate :seed)"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deletando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Populando BD...") { %x(rails db:seed) }
    else
      puts "voce nao esta em ambiente rails de desenvolvimento!"
    end
  end

  private
  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end

namespace :dev do
  desc "Configura o ambiente de desenvolvimento com (:drop :create :migrate :seed)"
  task setup: :environment do
    spinner = TTY::Spinner.new("[:Spinner] Deletando BD ...")
    spinner.auto_spin
    %x(rails db:drop)
    spinner.success('(concluido!)')

    spinner = TTY::Spinner.new("[:Spinner] Criando BD ...")
    spinner.auto_spin
    %x(rails db:create)
    spinner.success('(concluido!)')

    spinner = TTY::Spinner.new("[:Spinner] Migrando BD ... ")
    spinner.auto_spin
    %x(rails db:migrate)
    spinner.success('(concluido!)')

    spinner = TTY::Spinner.new("[:Spinner] Populando BD ...")
    spinner.auto_spin
    %x(rails db:seed)
    spinner.success('(concluido!)')
 
  end

end

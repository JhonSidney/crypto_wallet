class Coin < ApplicationRecord
    belongs_to :mining_type  #, optional: True  deixa o campo opcional dentro da tabela Coin 
end

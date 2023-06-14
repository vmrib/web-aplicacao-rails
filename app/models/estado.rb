class Estado < ApplicationRecord
    has_many :pessoa, dependent: :destroy
    validates :sigla, format: 
        { with: /\A[a-zA-Z]+\z/ }
    validates :sigla, length: { is: 2 }
    validates :nome, :sigla, uniqueness: true
    validates :nome, :sigla, presence: true
end

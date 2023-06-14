class Documento < ApplicationRecord
  belongs_to :pessoa
  validates :rg, :cpf, uniqueness: true
  validates :rg, :cpf, presence: true
  validates :rg, :cpf, numericality: { only_integer: true }
end

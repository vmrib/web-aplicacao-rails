class Pessoa < ApplicationRecord
  belongs_to :estado
  has_one :documento, dependent: :destroy
  has_and_belongs_to_many :esporte, -> { distinct }, dependent: :destroy
end

class Esporte < ApplicationRecord
    has_and_belongs_to_many :pessoa, -> { distinct }, dependent: :destroy
end

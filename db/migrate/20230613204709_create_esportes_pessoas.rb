class CreateEsportesPessoas < ActiveRecord::Migration[7.0]
  def change
    create_table :esportes_pessoas do |t|
      t.references :esporte, null: false, foreign_key: true
      t.references :pessoa, null: false, foreign_key: true

      t.timestamps
    end
  end
end

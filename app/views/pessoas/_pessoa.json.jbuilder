json.extract! pessoa, :id, :sobrenome, :nome, :estado_id, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)

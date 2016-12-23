json.extract! connection, :id, :component_id, :component, :identifier, :created_at, :updated_at
json.url connection_url(connection, format: :json)
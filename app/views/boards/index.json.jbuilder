json.array!(@boards) do |board|
  json.extract! board, :id, :name, :width, :height, :created_at
  json.url board_url(board, format: :json)
end

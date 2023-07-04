require 'json'

def update(data, name) 
  File.open("files/#{name}.json", 'w') do |file|
    file.write(JSON.pretty_generate(data))
  end
end

def save(data_array, name)
  return if data_array.empty?
  if Dir.exist?("files") 
    update(data_array, name)
  else
    Dir.mkdir("files")
    update(data_array, name)
  end
end

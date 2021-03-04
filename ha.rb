require 'pg' 
connection = PG::connect(dbname: "department") 
connection.internal_encoding = "UTF-8"

result = connection.exec("select name, division_id from members;") 
data = [] 
result.each do |record|
data << "Le nom du gars：#{record["name"]} est de la division number:#{record["division_id"]}"
end
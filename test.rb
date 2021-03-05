require 'webrick'
require 'erb'


erb_file = './web_appli.html.erb'
html_file = File.basename(erb_file, '.erb')#=>"page.html"

erb_str = File.read(erb_file)

renderer = ERB.new(erb_str)
result = renderer.result()

File.open(html_file, 'w') do |f|
  f.write(result)
end

path=File.expand_path'./web_appli.html'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => path,
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/web_appli', WEBrick::HTTPServlet::ERBHandler, 'web_appli.html.erb')
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
server.mount('/department.cgi', WEBrick::HTTPServlet::CGIHandler, 'department.rb')
server.mount('/good_goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'good_goya.rb')
server.mount('/quality_goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'quality_goya.rb')
server.start

# Start the CGI program that receives and returns the data
require 'cgi'
cgi = CGI.new
# After receiving the data, return the response in HTML format
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # Take out the data of "goya" used as a marker of information with the description cgi ['goya'] and assign it to a local variable.
  get = cgi['quality_goya']
  #Return response in HTML
  "<html>
    <body>
      <p>les bonnes informations sur goya sont: </p>
      String：#{get}
    </body>
  </html>"
}
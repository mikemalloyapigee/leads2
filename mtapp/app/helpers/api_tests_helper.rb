module ApiTestsHelper
  
  def parse_headers(header_str)
    unparsed_headers = header_str.split("||")
    headers = []
    unparsed_headers.each do |h|
      header_pieces = h.split(':')
      headers <<  { name: header_pieces[0].strip, value: header_pieces[1].strip }
    end
    return headers
  end
  
  
  
end

class HardWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def get_oauth_token(api_test)
    unparsed_headers = api_test.auth_headers.split("||")
    headers = []
    unparsed_headers.each do |h|
      header_pieces = h.split(':')
      header = { :name => header_pieces[0].strip, :value => header_pieces[1].strip }
      headers << header
    end
    # debugger
    c = Curl::Easy.http_post( api_test.auth_url, api_test.auth_body ) do |curl|
        headers.each do |h|
        curl.headers[h[:name]] = h[:value]
      end
    end
    access_code = JSON.parse(c.body_str)["access_token"]
    return { :response_code => c.response_code, :access_token => access_code}
  end
  
  def make_test_request(api_test, oauth_token)
    debugger
    puts "Req url: #{api_test.request_url}"
    c_ret = Curl::Easy.new(api_test.request_url) do |curl| 
      curl.headers["Authorization"] = "Bearer " + oauth_token 
      curl.verbose = true
    end  
    c_ret.perform
    puts "Response code: #{c_ret.response_code}"
    return { body: c_ret.body_str, response_code: c_ret.response_code}
  end  

  def perform(api_test_id, test_result_id)
    api_test = ApiTest.find(api_test_id)
    test_result = TestResult.find(test_result_id)
    auth_token = get_oauth_token(api_test)
    response_code = auth_token[:response_code]
    auth_token = auth_token[:access_token]
    resp = make_test_request(api_test, auth_token)
    test_result.response_body = resp[:body]
    test_result.req_response_code = resp[:response_code]
    test_result.auth_token = auth_token
    test_result.response_code = response_code
    test_result.save
  end
end
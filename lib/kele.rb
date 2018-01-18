require 'httparty'
require 'json'

class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email, password)
    options = {
      body: {
        email: email,
        password: password
      }
    }

    response = self.class.post('/sessions', options)
    if response.code == 200
      @auth_token = response.parsed_response["auth_token"]
    else
      puts "Error: #{response.code}. Authentication failed. Try again."
    end
  end

  def get_me
    response = self.class.get('/users/me', headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end
end

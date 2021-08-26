class ServeRest
  include Excon
  attr_accessor :base_uri, :token

  def initialize
    self.base_uri = $base_uri
    self.token = ''
  end

  def get(endpoint)
    Excon.get(base_uri + endpoint)
  end

  def post(endpoint, body)
    Excon.post(base_uri + endpoint,
      :headers => { 'Content-Type' => 'application/json'},
      :body => body.to_json
    )
  end

  def delete(endpoint)
    Excon.delete(base_uri + endpoint)
  end

  def put(endpoint, body)
    Excon.put(base_uri + endpoint,
      :headers => { 'Content-Type' => 'application/json' },
      :body => body.to_json
    )
  end

  def armazenar_token(token)
    self.token = token
  end

  def post_com_token(endpoint,body)
    result = Excon.post(base_uri + endpoint,
      :headers => 
      {
         'Content-Type' => 'application/json',
         'Authorization' => self.token 
      },
      :body => body.to_json
    )
    return result
  end

  def delete_com_token(endpoint)
    Excon.delete(base_uri + endpoint, :headers => {'Authorization' => self.token})
  end

  def put_com_id(endpoint)
    Excon.put(base_uri + endpoint + self.id,
      :headers => { 'Content-Type' => 'application/json' },
      :body => body.to_json
    )
    
  end



end



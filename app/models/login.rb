require 'singleton'

#This class is use to log to salesforce in order to use webservices
class Login
  include Singleton
   
  attr_reader :sessionId
    
  def getSessionId username, password, token
    client = Savon.client(wsdl: "app/assets/wsdl/enterprise.wsdl")
   #response = client.request :urn, :login, body: {username: username, password: password+token}
    message = { username: username, password: password+token }
    response = client.call(:login, message: message)
    data = response.to_hash
    return data[:login_response][:result]
    
  end
  
end


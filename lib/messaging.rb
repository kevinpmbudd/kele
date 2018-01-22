module Messaging
  def get_messages(page=nil)
    if @auth_token
      url = '/message_threads'
      if page
        response = self.class.get(url, query: { page: page }, headers: { "authorization" => @auth_token })
      else
        response = self.class.get(url, headers: { "authorization" => @auth_token })
      end
      JSON.parse(response.body)
    else
      puts "Not logged in. Please log in."
    end
  end

  def create_message(recipient_id, subject, text)
    url = '/messages'
    options = {
      body: {
        "sender": self.get_me["email"],
        "recipient_id": recipient_id,
        "subject": subject,
        "stripped-text": text.strip
      },
      headers: {
        "authorization" => @auth_token
      }
    }
    if @auth_token
      response = self.class.post(url, options)
      puts response
    else
      puts "Not logged in. Please log in."
    end
  end
end

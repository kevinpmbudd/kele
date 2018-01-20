module Roadmap
  def get_roadmap(roadmap_id)
    if @auth_token
      url = "/roadmaps/#{roadmap_id}"
      response = self.class.get(url, headers: { "authorization" => @auth_token })
      JSON.parse(response.body)
    else
      puts "Not logged in. Please log in."
    end
  end

  def get_checkpoint(checkpoint_id)
    if @auth_token
      url = "/checkpoints/#{checkpoint_id}"
      response = self.class.get(url, headers: { "authorization" => @auth_token })
      JSON.parse(response.body)
    else
      puts "Not logged in. Please log in."
    end 
  end
end

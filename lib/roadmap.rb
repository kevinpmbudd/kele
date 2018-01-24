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

  def get_submissions
    url = '/checkpoint_submissions'
    response = self.class.get(url, headers: { "authorization" => @auth_token })
    puts response
  end

  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
    url = '/checkpoint_submissions'
    options = {
      body: {
        "checkpoint_id": checkpoint_id,
        "assignment_branch": assignment_branch,
        "assignment_commit_link": assignment_commit_link,
        "comment": comment,
        "enrollment_id": self.get_me["current_enrollment"]["id"]
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

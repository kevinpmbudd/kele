module Checkpoints
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
        "content-type" => 'application/json',
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

# kele
bloc - ruby gem, api client

## Getting Started

1. $ gem build kele.gemspec

2. $ gem install ./kele-0.0.1.gem

3. $ irb

4. $ require ‘kele’

5. $ kele_client = Kele.new(email, password)

### Create Submission

kele_client.create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)

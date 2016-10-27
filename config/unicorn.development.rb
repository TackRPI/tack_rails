# Ansible managed: /Users/aeksco/github/aeksco-rails/railsbox/ansible/roles/unicorn/templates/unicorn.rb.j2 modified on 2016-04-14 17:58:54 by aeksco on Alexanders-MBP

working_directory '/aeksco-rails'

pid '/tmp/aeksco-rails/unicorn.development.pid'

stderr_path '/aeksco-rails/log/unicorn.err.log'
stdout_path '/aeksco-rails/log/unicorn.log'

listen '/tmp/unicorn.development.sock'

worker_processes 2

timeout 30

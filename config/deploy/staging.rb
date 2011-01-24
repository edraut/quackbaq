role :app, "184.106.133.196"
role :web, "184.106.133.196"
role :db,  "184.106.133.196", :primary => true
role :push, "184.106.133.184"

set :db_user, "quackbaq"
set :db_pass, "qu4ckb4q"

set :branch, "staging"

set :rails_env, "production"
